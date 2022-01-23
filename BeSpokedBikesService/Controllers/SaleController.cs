using Microsoft.AspNetCore.Mvc;
using BeSpokedBikesService.Contract.Business;
using BeSpokedBikesService.ViewModel;
using System.Collections.Generic;

namespace BeSpokedBikesService.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class SaleController : ControllerBase
    {
        private ISaleBusiness _saleBusiness;
        public SaleController(ISaleBusiness saleBusiness)
        {
            this._saleBusiness = saleBusiness;
        }

        [HttpGet]
        public List<SaleVM> GetAllSales()
        {
           return _saleBusiness.GetAll();
        }

        [HttpPost]
        public void CreateSale(SaleVM sale)
        {
            this._saleBusiness.InsertSale(sale);
        }
    }
}
