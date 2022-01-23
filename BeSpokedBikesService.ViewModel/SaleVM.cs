using System;
using System.Collections.Generic;
using System.Text;

namespace BeSpokedBikesService.ViewModel
{
    public class SaleVM
    {
        public int SaleId { get; set; }
        public int ProductId { get; set; }
        public int SalespersonId { get; set; }
        public int CustomerId { get; set; }
        public double Price { get; set; }
        public double Commission { get; set; }
        
        public ProductVM Product { get; set; }
        public SalesPersonVM SalesPerson { get; set; }
        public CustomerVM Customer { get; set; }
        public DateTime SalesDate { get; set; }

    }
}
