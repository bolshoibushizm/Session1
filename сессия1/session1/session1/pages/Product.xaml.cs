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
using System.Windows.Media.Media3D;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace session1.pages
{
    /// <summary>
    /// Логика взаимодействия для Product.xaml
    /// </summary>
    public partial class Product : Page
    {
        private int totalRecords; // Общее количество записей
        private int displayedRecords;
        public Product()
        {
            InitializeComponent();
            InitializeFilterBox();
        
            LV.ItemsSource = App.Context.Product.ToList();
            if (App._CurrentUser == null || App._CurrentUser.UserRole == 3)
            {
                Drop.Visibility = Visibility.Collapsed;
            }
            
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Update();
        }
        private void Update()
        {
            var ListofProduct = App.Context.Product.ToList();
            ListofProduct = ListofProduct.Where(p => p.ProductName.ToLower().Contains(SearchBox.Text.ToLower())|| p.ProductDescription.ToLower().Contains(SearchBox.Text.ToLower())
            || p.ProductManufacturer.ToLower().Contains(SearchBox.Text.ToLower()) || p.ProductArticleNumber.ToLower().Contains(SearchBox.Text.ToLower())).ToList();
            if (SortBox.SelectedIndex==1)
            {
                ListofProduct = ListofProduct.OrderByDescending(p=> p.ProductCost).ToList();
            }
            if (SortBox.SelectedIndex==2)
            {
                ListofProduct = ListofProduct.OrderBy(p => p.ProductCost).ToList();
            }
            if (FilterBox.SelectedIndex!=0) 
            {
                ListofProduct = ListofProduct.Where(p => p.TypeProduct.NameCategory == FilterBox.SelectedItem.ToString()).ToList();
            }

            totalRecords = App.Context.Product.Count();
            displayedRecords = ListofProduct.Count();
            countvalue.Text = $"{displayedRecords} из {totalRecords}";
            LV.ItemsSource = ListofProduct;
        }

        private void SortBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                Update();
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }
        }
        private void InitializeFilterBox()
        {
            List<string> Filter = new List<string> { "Все  производители" };
            Filter.AddRange(App.Context.TypeProduct.Select(p=>p.NameCategory));
            FilterBox.ItemsSource = Filter;
            FilterBox.SelectedIndex=0;
        }

        private void FilterBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                Update();
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }

        }

        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                Update();
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }

        }

     

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            try
            {


                var deleteitem = (sender as Button).DataContext as db.Product;
                var d = App.Context.OrderProduct.FirstOrDefault(p => p.ProductArticleNumber == deleteitem.Id);
                if (d == null)
                {
                    if (MessageBox.Show("Вы уверены что хотите удалить товар" + deleteitem.ProductName, "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes) ;
                    {
                        App.Context.Product.Remove(deleteitem);
                        App.Context.SaveChanges();
                        MessageBox.Show("товар успешно удалён");
                    }
                }
                else
                {
                    MessageBox.Show("Нельзя удалить товар, так как он присутствует в заказе");
                }
            }

            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }
        }
        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (App._CurrentUser != null)
                {
                    var asd = (sender as Button).DataContext as db.Product;
                    NavigationService.Navigate(new AddEditProduct(asd));

                }
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }
        }

        private void Edit_Click_1(object sender, RoutedEventArgs e)
        {

        }
    }
}
