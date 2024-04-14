using School.BD;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для clientsEdit.xaml
    /// </summary>
    public partial class clientsEdit : Page
    {
        Client client;
        private int curSelPr;
        private int curTypAg = 0;
        private bool isEdit = true;
        public string fnd;
        public clientsEdit(Client clients)
        {
            InitializeComponent();

            GenderCode.SelectedIndex = 0;

            try
            {
                serviceList.ItemsSource = helper.GetContext().Service.ToList();
            }
            catch (Exception ex) { }

            if (clients != null)
            {
                isEdit = true;
                client = clients;
                this.FirstName.Text = clients.FirstName;
                this.LastName.Text = clients.LastName;
                this.Patronymic.Text = clients.Patronymic;
                this.Phone.Text = clients.Phone;
                this.Email.Text = clients.Email;
                this.dateBirtday.Text = clients.Birthday.ToString();

                GenderCode.SelectedIndex = client.GenderCode == "м" ?  0 : 1;

                Load();
                btnWriteAg.Content = "Изменить";
            }
            else
            {
                isEdit = false;
                client = new Client();
                btnDelAg.IsEnabled = false;
                btnWritHi.IsEnabled = false;
                btnDelHi.IsEnabled = false;
                btn_changeTag.IsEnabled = false;
            }
        }

        public void Load() {
            var tempValue = helper.GetContext().ClientService.Where(ClientService => ClientService.ClientID == client.ID).ToList();


            foreach (ClientService item in tempValue) 
            {
                item.Service.Discount = item.Service.Discount * 100;            
            }

            historyGrid.ItemsSource = tempValue;

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
                historyGrid.ItemsSource = helper.GetContext().ClientService.Where(ClientService => ClientService.ClientID == client.ID).ToList();
            }
            catch { return; };
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            try
            {
                if (curSelPr > 0 && date.ToString() != string.Empty)
                {
                    ClientService cS = new ClientService();
                    cS.StartTime = Convert.ToDateTime(date.ToString());
                    cS.ClientID = client.ID;
                    cS.ServiceID = curSelPr;
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

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if (client.ClientService.Count > 0)
            {
                MessageBox.Show("Удаление невозможно, клиент воспользовался услугами!");
                return;
            }

            if (client.Tag.Count > 0)
            {
                MessageBox.Show("Удаление невозможно, клиенту присвоены тэги");
                return;
            }
            foreach (ClientService cs in client.ClientService)
            {
                helper.GetContext().ClientService.Remove(cs);
            }
            helper.GetContext().Client.Remove(client);

            helper.GetContext().SaveChanges();
            MessageBox.Show("Удаление информации об клиенте завершено!");
            this.NavigationService.GoBack();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (FirstName.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Имя не заполнено!");
                return;
            }
            if (LastName.Text.Trim() == string.Empty)
            {
                MessageBox.Show("Фамилия не заполнена!");
                return;
            }
            if (!(new Regex(@"^\+?\d{0,2}\-?\d{3}\-?\d{3}\-?\d{4}")).IsMatch(this.Phone.Text))
            {
                MessageBox.Show("Неверно введен номер телефона!");
                return;
            }
            if ((this.Email.Text != "") && (!(new Regex(@"(\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)")).IsMatch(this.Email.Text)))
            {
                MessageBox.Show("Неверно введена почта!");
                return;
            }
            if (dateBirtday.Text == string.Empty)
            {
                MessageBox.Show("Не вверно введена дата рождения!");
                return;
            }
            client.FirstName = this.FirstName.Text.Trim();
            client.LastName = this.LastName.Text.Trim();
            client.Patronymic = this.Patronymic.Text.Trim();
            client.Phone = this.Phone.Text.Trim();
            client.Email = this.Email.Text.Trim();
            client.Birthday = Convert.ToDateTime(this.dateBirtday.Text);
            client.RegistrationDate = DateTime.Now;
            client.GenderCode = GenderCode.SelectedIndex == 0 ? "м" : "ж";
            try
            {
                if (isEdit)
                {
                    helper.GetContext().Entry(client).State = EntityState.Modified;
                    helper.GetContext().SaveChanges();
                    MessageBox.Show("Обновление информации об клиенте завершено");
                }
                else
                {
                    helper.ent.Client.Add(client);
                    helper.ent.SaveChanges();
                    MessageBox.Show("Добавление информации об клиенте завершено");
                }
            }
            catch { };
            btnDelAg.IsEnabled = true;
            btnWritHi.IsEnabled = true;
            btnDelHi.IsEnabled = true;
            btn_changeTag.IsEnabled = true;
        }

        private void btn_changeTag_Click(object sender, RoutedEventArgs e)
        {
            Tegochnaya tegochnaya = new Tegochnaya(client);
            tegochnaya.ShowDialog();
        }

        private void historyGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void mask_TextChanged(object sender, TextChangedEventArgs e)
        {
            fnd = ((TextBox)sender).Text;
            try
            {
                serviceList.ItemsSource = helper.GetContext().Service.Where(Service => Service.Title.Contains(fnd)).ToList();
            }
            catch { };
        }

        private void serviceList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                var sL = serviceList.SelectedItem as Service;
                if (sL != null)
                    curSelPr = sL.ID;
            }
            catch (Exception ex) { }
        }
    }
}
