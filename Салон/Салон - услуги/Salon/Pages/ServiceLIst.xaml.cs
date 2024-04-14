using Salon.BD;
using System;
using System.Collections.Generic;
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
using static Salon.MainWindow;

namespace Salon.Pages
{
    /// <summary>
    /// Логика взаимодействия для ServiceLIst.xaml
    /// </summary>
    public partial class ServiceLIst : Page
    {
        Frame Frame;
        private int start = 0;
        private int fullCount = 0;
        private int order = 0;
        private int filterinfId = 0;
        private int iag = 10;
        private string fnd = string.Empty;
        private bool birthday = false;
        public ServiceLIst(Frame frame)
        {
            Frame = frame;
            InitializeComponent();

            Load();
        }

        public void Load()
        {
            try
            {
                List<Service> services = new List<Service>();
                var sr = helper.GetContext().Service.Where(Service => Service.Title.Contains(fnd));

                services.Clear();

                foreach (Service item in sr)
                {
                    if (item.MainImagePath == "" || item.MainImagePath == null)
                    {
                        item.MainImagePath = "/Услуги салона красоты/122454.png";
                    }
                    else
                    {
                        item.MainImagePath = @"\" + item.MainImagePath.Remove(0, 1);
                    }

                    services.Add(item);
                }

                fullCount = sr.Count();

                int ost = fullCount % iag;
                int pag = (fullCount - ost) / iag;
                if (ost > 0) pag++;
                pagin.Children.Clear();
                for (int i = 0; i < pag; i++)
                {
                    Button myButton = new Button();
                    myButton.Height = 30;
                    myButton.Content = i + 1;
                    myButton.Width = 20;
                    myButton.HorizontalAlignment = HorizontalAlignment.Center;
                    myButton.Tag = i;
                    myButton.Click += new RoutedEventHandler(paginButto_Click);
                    pagin.Children.Add(myButton);
                }

                if (order == 0) serviceGrid.ItemsSource = services.OrderBy(Product => Product.ID).Skip(start * iag).Take(iag).ToList();
                if (order == 1) serviceGrid.ItemsSource = services.OrderBy(Product => Product.Title).Skip(start * iag).Take(iag).ToList();
                if (order == 2) serviceGrid.ItemsSource = services.OrderByDescending(Product => Product.Title).Skip(start * iag).Take(iag).ToList();
                if (order == 3) serviceGrid.ItemsSource = services.OrderBy(Product => Product.Cost).Skip(start * iag).Take(iag).ToList();
                if (order == 4) serviceGrid.ItemsSource = services.OrderByDescending(Product => Product.Cost).Skip(start * iag).Take(iag).ToList();
                if (order == 5) serviceGrid.ItemsSource = services.OrderBy(Product => Product.DurationInSeconds).Skip(start * iag).Take(iag).ToList();
                if (order == 6) serviceGrid.ItemsSource = services.OrderByDescending(Product => Product.DurationInSeconds).Skip(start * iag).Take(iag).ToList();

                full.Text = fullCount.ToString();
                turnButton();
            }
            catch
            {
                return;
            };

        }

        private void turnButton()
        {
            if (start == 0) { back.IsEnabled = false; }
            else { back.IsEnabled = true; };
            if ((start) * iag + iag >= fullCount) { forward.IsEnabled = false; }
            else { forward.IsEnabled = true; };
        }

        private void paginButto_Click(object sender, RoutedEventArgs e)
        {
            start = Convert.ToInt32(((Button)sender).Tag.ToString());
            Load();

        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            fnd = ((TextBox)sender).Text;
            Load();
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = (ComboBox)sender;
            ComboBoxItem selectedItem = (ComboBoxItem)comboBox.SelectedItem;
            order = Convert.ToInt32(selectedItem.Tag.ToString());
            Load();
        }

        private void cmb_count_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            iag = cmb_count.SelectedIndex == 0 ? 10 : cmb_count.SelectedIndex == 1 ? 50 : 200;
            Load();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            start--;
            Load();
        }

        private void Button_Click1(object sender, RoutedEventArgs e)
        {
            start++;
            Load();
        }

        private void addButton_Click(object sender, RoutedEventArgs e)
        {
            Frame.Content = new serviceEditt(null);
        }


        private void serviceGrid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (serviceGrid.SelectedItems.Count > 0)
            {
                Service service = serviceGrid.SelectedItems[0] as Service;

                if (service != null)
                {
                    Frame.Content = new serviceEditt(service);
                }
            }
        }
    }
}
