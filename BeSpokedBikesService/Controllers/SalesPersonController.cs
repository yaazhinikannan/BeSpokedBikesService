using Microsoft.AspNetCore.Mvc;
using BeSpokedBikesService.Contract.Business;
using BeSpokedBikesService.ViewModel;
using System.Collections.Generic;

namespace BeSpokedBikesService.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class SalesPersonController : ControllerBase
    {
        private ISalesPersonBusiness _salesPersonBusiness;
        public  SalesPersonController(ISalesPersonBusiness salesPersonBusiness)
        {
            this._salesPersonBusiness = salesPersonBusiness;
        }

        [HttpGet]
        public List<SalesPersonVM> GetAllSalesPersons()
        {
            return this._salesPersonBusiness.GetAll();
        }
        [HttpPost]
        public  List<SalesPersonVM> GetSalesPersonReport(int salesPersonId,int quarter,int year)
        {
           return this._salesPersonBusiness.GetSalesPersonReport(salesPersonId,quarter,year);
        }
        [HttpPost]
        public void UpdateSalesPersonDetails(SalesPersonVM salesPersonData)
        {
            this._salesPersonBusiness.UpdateSalesPersonDetails(salesPersonData);
        }
    }
}
