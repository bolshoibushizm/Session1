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

namespace session1.pages
{
    /// <summary>
    /// Логика взаимодействия для Trade.xaml
    /// </summary>
    public partial class Trade : Page
    {
        public Trade()
        {
            InitializeComponent();
            LV.ItemsSource = App.Context.Product.ToList();
        }
    }
}
