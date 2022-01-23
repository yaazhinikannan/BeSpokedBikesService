using System;
using System.Collections.Generic;
using System.Text;

namespace BeSpokedBikesService.Model
{
    public class Report
    {

        public int SalesPersonId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime SalesDate { get; set; }
        public double SalesCommission { get; set; }

    }
}
