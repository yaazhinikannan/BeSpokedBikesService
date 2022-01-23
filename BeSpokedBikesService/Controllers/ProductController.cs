using Microsoft.AspNetCore.Mvc;
using BeSpokedBikesService.Contract.Business;
using BeSpokedBikesService.ViewModel;
using System.Collections.Generic;

namespace BeSpokedBikesService.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private IProductBusiness _productBusiness;
        public ProductController(IProductBusiness productBusiness)
        {
             this._productBusiness = productBusiness;
        }

        [HttpGet]
        public List<ProductVM> GetAllProducts()
        {
           return this._productBusiness.GetAll();
        }

        [HttpPost]
        public void UpdateProductDetails(ProductVM productvm)
        {
           this._productBusiness.UpdateProductDetails(productvm);
        }

    }
}
