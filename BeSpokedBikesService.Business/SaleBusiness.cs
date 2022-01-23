using System;
using AutoMapper;
using BeSpokedBikesService.Contract.Business;
using BeSpokedBikesService.Contract.Data;
using BeSpokedBikesService.ViewModel;

using System.Collections.Generic;
using BeSpokedBikesService.Model;

namespace BeSpokedBikesService.Business
{
    public class SaleBusiness :ISaleBusiness
    {
        private readonly IMapper _mapper;
        private ISaleData _saleData;

        public SaleBusiness(IMapper mapper,ISaleData saleData)
        {
            this._mapper = mapper;
            this._saleData = saleData;
        }
        public List<SaleVM> GetAll()
        {
          return _mapper.Map <List< SaleVM>>(this._saleData.GetAll());
        }

        public void InsertSale(SaleVM saleDetails)
        {
           this._saleData.InsertSale(_mapper.Map<Sale>(saleDetails));
        }
    }
}
