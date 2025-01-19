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

namespace session1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new pages.Product());
            if (App._CurrentUser != null)
            {
                string a = App._CurrentUser.UserName;
                string b = App._CurrentUser.UserPatronymic;
                string c = App._CurrentUser.UserSurname;
                var x = a + " " + b + " " + c;
                AuthorizInfo.Text = x;
                if (App._CurrentUser != null || App._CurrentUser.UserRole != 3)
                {
                    Add.Visibility = Visibility.Visible;
                }
            }
            


        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MainFrame.Navigate(new pages.AddEditProduct());
                Add.Visibility = Visibility.Collapsed;
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Autoriz autoriz = new Autoriz();
                autoriz.Show();
                this.Close();
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }
        }
    }
}
