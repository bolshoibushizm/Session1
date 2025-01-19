using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Remoting.Messaging;
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
    /// Логика взаимодействия для AddEditProduct.xaml
    /// </summary>
    public partial class AddEditProduct : Page
    {
        private db.Product _newPoduct=null;
        public int idtype;
        string PhotoWay;
        public AddEditProduct()
        {
            try
            {
                InitializeComponent();
                InitializeBox();
                if (App._CurrentUser == null || App._CurrentUser.UserRole == 3)
                {
                    AdminPanel.Visibility = Visibility.Collapsed;
                }
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }

        }
        public AddEditProduct(db.Product product)
        {
            try {
                InitializeComponent();
                InitializeBox();
                _newPoduct = product;
                NameBox.Text = product.ProductName;
                ArticleBox.Text = product.ProductArticleNumber;
                CountBox.Text = product.ProductQuantityInStock.ToString();
                MetrickBox.Text = product.UnitofMetrick;
                CountBox.Text = product.ProductCost.ToString();
                ProviderBox.Text = product.Provider;
                DescBox.Text = product.ProductDescription;
                idtype = product.ProductCategory;
                ManuBox.Text = product.ProductManufacturer;
                PhotoWay = product.ProductPhoto;
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }
        }
        public void InitializeBox()
        {
            List <string> strings = new List <string>();
            strings.AddRange(App.Context.TypeProduct.Select(p=>p.NameCategory).ToList());
            CategoryBox.ItemsSource = strings;
            CategoryBox.SelectedIndex = 0;
        }

    
        private void Save_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var errors = Errors();

                if (errors.Length == 0)
                {
                    if (_newPoduct == null)
                    {
                        var newproduct = new db.Product
                        {
                            ProductArticleNumber = ArticleBox.Text,
                            ProductCategory = idtype,
                            ProductDescription = DescBox.Text,
                            ProductName = NameBox.Text,
                            UnitofMetrick = MetrickBox.Text,
                            ProductCost = decimal.Parse(CountBox.Text),
                            ProductQuantityInStock = int.Parse(CountBox.Text),
                            Provider = ProviderBox.Text,
                            ProductManufacturer = ManuBox.Text,
                            ProductPhoto = PhotoWay
                        };
                        App.Context.Product.Add(newproduct);
                        App.Context.SaveChanges();
                        MessageBox.Show("збс");
                        NavigationService.GoBack();
                    }
                    else
                    {
                        _newPoduct.ProductArticleNumber = ArticleBox.Text;
                        _newPoduct.ProductCategory = idtype;
                        _newPoduct.ProductDescription = DescBox.Text;
                        _newPoduct.ProductName = NameBox.Text;
                        _newPoduct.UnitofMetrick = MetrickBox.Text;
                        _newPoduct.ProductCost = decimal.Parse(CountBox.Text);
                        _newPoduct.ProductQuantityInStock = int.Parse(CountBox.Text);
                        _newPoduct.Provider = ProviderBox.Text;
                        _newPoduct.ProductManufacturer = ManuBox.Text;
                        _newPoduct.ProductPhoto = PhotoWay;
                        App.Context.SaveChanges();
                        MessageBox.Show("успешный редач");
                        NavigationService.GoBack();
                    }
                }
                else
                {
                    MessageBox.Show(errors);
                }
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }
        }

        private void CategoryBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                var selectedCategory = App.Context.TypeProduct.FirstOrDefault(p => p.NameCategory == CategoryBox.SelectedItem.ToString());
                if (selectedCategory != null)
                {
                    idtype = selectedCategory.ProductCategory;
                }
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }
        }
        private void PhotoSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                OpenFileDialog ofd = new OpenFileDialog();
                ofd.Filter = "Image files |*.png;*.jpg;*.jpeg";

                if (ofd.ShowDialog() == true)
                {
                    BitmapImage bitmap = new BitmapImage(new Uri(ofd.FileName, UriKind.RelativeOrAbsolute));

                    if (bitmap.PixelWidth == 300 && bitmap.PixelHeight == 200)
                    {
                        PhotoWay = ofd.FileName;
                        PickImage.Source = bitmap;
                    }
                    else
                    {
                        MessageBox.Show("Изображение должно быть размером 300x200 пикселей.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    }
                }
            }
            catch (System.Data.Entity.Core.EntityException)
            {
                MessageBox.Show("Ошибка подключения к базе данных");
            }
        }
        private string Errors ()
        {
           StringBuilder stringBuilder = new StringBuilder();
            var isPresence = App.Context.Product.FirstOrDefault(p => p.ProductArticleNumber == ArticleBox.Text && p.ProductName == NameBox.Text);
            
            if (isPresence != null)
            {
               stringBuilder.AppendLine("Такой товар уже существует");
            }

            if (string.IsNullOrEmpty(ArticleBox.Text))
            {
                stringBuilder.AppendLine("Артикул обязателен для заполнения");
            }
            if (string.IsNullOrEmpty(NameBox.Text))
            {
                stringBuilder.AppendLine("Название обязательно для заполнения");
            }
            if (string.IsNullOrEmpty(CostBox.Text))
            {
                stringBuilder.AppendLine("Стоимость обязателена для заполнения");
            }
            if (string.IsNullOrEmpty(ManuBox.Text))
            {
                stringBuilder.AppendLine("Производитель обязателен для заполнения");
            }
            if (CategoryBox.SelectedItem == null)
            {
                stringBuilder.AppendLine("Категория товаров не выбрана");
            }
            if (string.IsNullOrEmpty(CountBox.Text))
            {
                stringBuilder.AppendLine("Количество обязателено для заполнения");
            }
            if (string.IsNullOrEmpty(DescBox.Text))
            {
                stringBuilder.AppendLine("Описание обязателено для заполнения");
            }

            decimal cost = 0;
            if (decimal.TryParse(CostBox.Text, out cost) == false || cost<=0)
            {
                stringBuilder.AppendLine("Стоимость должна быть положительным числом");
            }
            int count = 0;
            if (int.TryParse(CountBox.Text, out count) == false || count < 0)
            {
                stringBuilder.AppendLine("Количество должно быть целым неотрицательным числом");
            }
                return stringBuilder.ToString();
        }

    }
}
