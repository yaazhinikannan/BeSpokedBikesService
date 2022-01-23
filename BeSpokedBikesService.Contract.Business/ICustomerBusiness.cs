using System;
using System.Collections.Generic;
using System.Text;
using BeSpokedBikesService.ViewModel;

namespace BeSpokedBikesService.Contract.Business
{
    public interface ICustomerBusiness
    {
        List<CustomerVM> GetAll();
    }
}
