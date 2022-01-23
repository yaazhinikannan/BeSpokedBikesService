using System;
using AutoMapper;
using BeSpokedBikesService.Contract.Business;
using BeSpokedBikesService.Contract.Data;
using BeSpokedBikesService.ViewModel;
using System.Collections.Generic;
using BeSpokedBikesService.Model;

namespace BeSpokedBikesService.Business
{
    public class ProductBusiness : IProductBusiness
    {
        private readonly IMapper _mapper;
        private readonly IProductData _productData;

        public ProductBusiness(IMapper mapper, IProductData productData)
        {
            this._mapper= mapper;
            this._productData= productData;

        }
        public List<ProductVM> GetAll()
        {
            var products = _mapper.Map<List<ProductVM>>(this._productData.GetAll());
            return products;
            //return _mapper.Map<List<ProductVM>> (this._productData.GetAll());
        }

        public void UpdateProductDetails(ProductVM data)
        {
          this._productData.UpdateProductDetails(_mapper.Map<Product>(data));
        }
    }
}
