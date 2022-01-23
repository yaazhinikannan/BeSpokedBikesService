using System;
using System.Collections.Generic;
using System.Text;

namespace BeSpokedBikesService.Model
{
    public class Product
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string Manufacturer { get; set; }
        public string Style { get; set; }
        public double PurchasePrice { get; set; }
        public double SalePrice { get; set; }
        public int QtyOnHand { get; set; }
        public int ProductDiscount { get; set; }
        public double CommissionPercentage { get; set; }
    }
}
