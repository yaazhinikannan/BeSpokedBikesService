using System;
using System.Collections.Generic;
using System.Text;
using BeSpokedBikesService.ViewModel;

namespace BeSpokedBikesService.Contract.Business
{
    public interface IProductBusiness
    {
        List<ProductVM> GetAll();
        void UpdateProductDetails(ProductVM data);
    }
}
