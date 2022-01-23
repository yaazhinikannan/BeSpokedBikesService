using System;
using AutoMapper;
using BeSpokedBikesService.Contract.Business;
using BeSpokedBikesService.Contract.Data;
using BeSpokedBikesService.ViewModel;
using System.Collections.Generic;

namespace BeSpokedBikesService.Business
{
    public class CustomerBusiness : ICustomerBusiness
    {
        private readonly IMapper _mapper;
        private ICustomerData _customerData;

        public CustomerBusiness(ICustomerData customerData, IMapper mapper)
        {
            this._customerData = customerData;
            this._mapper = mapper;
        }
        public List<CustomerVM> GetAll()
        {
            return _mapper.Map<List<CustomerVM>>( this._customerData.GetAll());
        }
    }
}
