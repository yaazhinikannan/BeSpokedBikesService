using System;
using System.Collections.Generic;
using System.Text;

namespace BeSpokedBikesService.Model
{
    public class Sale
    {
        public int SaleId { get; set; }
        public int ProductId { get; set; }
        public int SalespersonId { get; set; }
        public int CustomerId { get; set; }
        public double Price { get; set; }
        public double Commission { get; set; }
        public DateTime SalesDate { get; set; }
        
        public Product Product{ get; set; }
        public SalesPerson SalesPerson{ get;set;}
        public Customer Customer { get; set; }
    }
}
