using System.Collections.Generic;
using BeSpokedBikesService.Model;

namespace BeSpokedBikesService.Contract.Data
{
    public interface ICustomerData
    {
        List<Customer> GetAll(); 
    }
}
