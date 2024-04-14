using School.BD;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using static School.MainWindow;

namespace School.Pages
{
    /// <summary>
    /// Логика взаимодействия для serviceEdit.xaml
    /// </summary>
    public partial class serviceEdit : Page
    {
        Service Service;
        private int curSelPr;
        private int curTypAg = 0;
        private bool isEdit = true;
        public string fnd;
        public serviceEdit(Service service)
        {
            InitializeComponent();
            try
            {
                clientList.ItemsSource = helper.GetContext().Client.ToList();
            }
            catch (Exception ex) { }

            if (service != null)
            {
                isEdit = true;
                Service = service;
                this.Title.Text = service.Title;
                this.Cost.Text = service.Cost.ToString();
                this.Discount.Text = (service.Discount * 100).ToString();
                this.DurationInSeconds.Text = service.DurationInSeconds.ToString();
                Load();
                btnWriteAg.Content = "Изменить";
            }
            else
            {
                isEdit = false;
                Service = new Service();
                btnDelAg.IsEnabled = false;
                btnWritHi.IsEnabled = false;
                btnDelHi.IsEnabled = false;
            }
        }

        public void Load()
        {
            historyGrid.ItemsSource = helper.GetContext().ClientService.Where(ClientService => ClientService.ServiceID == Service.ID).ToList();
        }

        private void historyGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (Title.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Название не заполнено!");
                return;
            }
            if (Cost.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Цена не заполнена!");
                return;
            }
            if (DurationInSeconds.Text.Trim() == string.Empty && int.Parse(DurationInSeconds.Text) > 0)
            {
                MessageBox.Show("Продолэительность не заполнена!");
                return;
            }
            if (Discount.Text.Trim() == string.Empty && (int.Parse(Discount.Text) < 0 || int.Parse(Discount.Text) > 0))
            {
                MessageBox.Show("Скидка не заполнена!");
                return;
            }
            Service.Title = this.Title.Text;
            Service.Cost = decimal.Parse(this.Cost.Text);
            Service.DurationInSeconds = int.Parse(this.DurationInSeconds.Text);
            Service.Discount = double.Parse((int.Parse(Discount.Text) / 100).ToString());
            try
            {
                if (isEdit)
                {
                    helper.GetContext().Entry(Service).State = EntityState.Modified;
                    helper.GetContext().SaveChanges();
                    MessageBox.Show("Обновление информации о услуге завершено");
                }
                else
                {
                    helper.ent.Service.Add(Service);
                    helper.ent.SaveChanges();
                    MessageBox.Show("Добавление информации о услуге завершено");
                }
            }
            catch { };
            btnDelAg.IsEnabled = true;
            btnWritHi.IsEnabled = true;
            btnDelHi.IsEnabled = true;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if (Service.ClientService.Count > 0)
            {
                MessageBox.Show("Удаление невозможно!");
                return;
            }

            foreach (ClientService cs in Service.ClientService)
            {
                helper.GetContext().ClientService.Remove(cs);
            }
            helper.GetContext().Service.Remove(Service);

            helper.GetContext().SaveChanges();
            MessageBox.Show("Удаление услуги завершено!");
            this.NavigationService.GoBack();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            try
            {
                if (curSelPr > 0 && date.ToString() != string.Empty)
                {
                    ClientService cS = new ClientService();
                    cS.StartTime = Convert.ToDateTime(date.ToString());
                    cS.ClientID = curSelPr;
                    cS.ServiceID = Service.ID;
                    try
                    {
                        helper.GetContext().ClientService.Add(cS);
                        helper.GetContext().SaveChanges();
                        Load();
                    }
                    catch
                    {
                        return;
                    }
                }
            }
            catch
            {
                MessageBox.Show("Произошла ошибка!");
            }
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            for (int i = 0; i < historyGrid.SelectedItems.Count; i++)
            {
                ClientService prs = historyGrid.SelectedItems[i] as ClientService;
                if (prs != null)
                {
                    helper.GetContext().ClientService.Remove(prs);
                }
            }
            try
            {
                helper.GetContext().SaveChanges();
                historyGrid.ItemsSource = helper.GetContext().ClientService.Where(ClientService => ClientService.ServiceID == Service.ID).ToList();
            }
            catch { return; };
        }

        private void mask_TextChanged(object sender, TextChangedEventArgs e)
        {
            fnd = ((TextBox)sender).Text;
            try
            {
                clientList.ItemsSource = helper.GetContext().Client.Where(Client => Client.LastName.Contains(fnd)).ToList();
            }
            catch { };
        }

        private void serviceList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void clientList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                var sL = clientList.SelectedItem as Client;
                if (sL != null)
                    curSelPr = sL.ID;
            }
            catch (Exception ex) { }
        }
    }
}
