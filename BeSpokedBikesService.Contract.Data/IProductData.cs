using System;
using System.Collections.Generic;
using System.Text;
using BeSpokedBikesService.Model;
namespace BeSpokedBikesService.Contract.Data
{
    public interface IProductData
    {
        List<Product> GetAll();
        void UpdateProductDetails(Product data);
    }
}
