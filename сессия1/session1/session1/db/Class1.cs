using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace session1.db
{
    partial class Product
    {
        public string source_image
        {
            get
            {
                if (string.IsNullOrEmpty(ProductPhoto))
                {
                    return "\\image\\picture.png";
                }
                else
                {
                    return ProductPhoto;
                }
            }
        }
        public string GetInStock
        {
            get
            {
                if (ProductQuantityInStock ==0)
                {
                    return "Нет в наличии";
                }
                else
                {
                    return "В наличии";
                }
            }
        }
        public string Color
        {
            get
            {
                if (ProductQuantityInStock == 0)
                {
                    return "#808080";
                }
                else
                {
                    return "#FFFFFF";
                }
            }
        }
        public string GetManu
        {
            get
            {
                return $"Производитель:{ProductManufacturer}";
            }
        }
        public string GetCost
        {
            get
            {
                return $"Цена:{ProductCost}";
            }
        }


    }
}
