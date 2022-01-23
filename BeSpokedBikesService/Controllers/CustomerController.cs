using Microsoft.AspNetCore.Mvc;
using BeSpokedBikesService.Contract.Business;
using BeSpokedBikesService.ViewModel;
using System.Collections.Generic;

namespace BeSpokedBikesService.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private ICustomerBusiness _customerBusiness;

        public CustomerController(ICustomerBusiness customerBusiness)
        {
            this._customerBusiness = customerBusiness;
        }
        [HttpGet]
        public List<CustomerVM> GetAllCustomers()
        {
            return this._customerBusiness.GetAll();
        }
    }
}
