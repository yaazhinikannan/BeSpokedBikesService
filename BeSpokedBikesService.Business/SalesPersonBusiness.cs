using System;
using AutoMapper;
using BeSpokedBikesService.Contract.Business;
using BeSpokedBikesService.Contract.Data;
using BeSpokedBikesService.ViewModel;
using System.Collections.Generic;
using BeSpokedBikesService.Model;

namespace BeSpokedBikesService.Business
{
    public class SalesPersonBusiness :ISalesPersonBusiness
    {
        private readonly IMapper _mapper;
        private ISalesPersonData _iSalePersonData;

        public SalesPersonBusiness(IMapper mapper,ISalesPersonData salesPersonData )
        {
            this._mapper = mapper;  
            this._iSalePersonData = salesPersonData;
        }

        public List<SalesPersonVM> GetAll()
        {
            return _mapper.Map<List<SalesPersonVM>>( this._iSalePersonData.GetAll());
        }

        public List<SalesPersonVM> GetSalesPersonReport(int salesPersonId, int quarter, int year)
        {
            return _mapper.Map<List<SalesPersonVM>>( this._iSalePersonData.GetSalesPersonReport(salesPersonId, quarter,year));
        }

        public void UpdateSalesPersonDetails(SalesPersonVM data)
        {
            this._iSalePersonData.UpdateSalesPersonDetails(_mapper.Map<SalesPerson>(data));
        }
    }
}
