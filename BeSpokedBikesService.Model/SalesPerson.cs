using System;
using System.Collections.Generic;
using System.Text;

namespace BeSpokedBikesService.Model
{
    public class SalesPerson
    {
        public int SalesPersonId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string Address { get; set; }
        public string Phone { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime TerminationDate { get; set; }
        public string ManagerName { get; set; } 
    }
}
