using System;
using System.Collections.Generic;
using System.Text;

namespace BeSpokedBikesService.ViewModel
{
    public class CustomerVM
    {
        public int CustomerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }

        public string PhoneNumber { get; set; }

        //public DateTime StartDate { get; set; }
    }
}
