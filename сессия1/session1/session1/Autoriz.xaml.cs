using session1.db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace session1
{
    /// <summary>
    /// Логика взаимодействия для Autoriz.xaml
    /// </summary>
    public partial class Autoriz : Window
    {
        bool firstenter;
        string capcha;
        public Autoriz()
        {
            firstenter = true;
            InitializeComponent();
        }

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var user = App.Context.User.FirstOrDefault(p => p.UserLogin == LoginBox.Text && p.UserPassword == PB.Password);
                if (firstenter)
                {
                    if (user != null)
                    {
                        App._CurrentUser = user;
                        MainWindow mainWindow = new MainWindow();
                        mainWindow.Show();
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("Пользователь с такими данными не найден");
                        CapchaPanel.Visibility = Visibility.Visible;
                        CapchaGenerate();
                    }
                }
                else if (!firstenter && CheckCapcha() && user != null)
                {
                    App._CurrentUser = user;
                    MainWindow mainWindow = new MainWindow();
                    mainWindow.Show();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Пользователь с такими данными не найден");
                    firstenter = false;
                    CapchaGenerate();
                    Thread.Sleep(10000);
                }
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }

        }
        private void CapchaGenerate()
        {
            capcha = "";
            string[] elements = new string[] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "9", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M" };
            Random random = new Random();

            for (int i = 0;i<4;i++)
            {
                capcha += elements[random.Next(elements.Length)];
            }
            TextCapcha.Text=capcha ;
        }
        private bool CheckCapcha()
        {
            if (capcha == capchaBox.Text)
            {
                return true;
            }
            return false;
        }

        private void Guest_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                App._CurrentUser = null;
                MainWindow mainWindow = new MainWindow();
                mainWindow.Show();
                this.Close();
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }
        }
    }
}
