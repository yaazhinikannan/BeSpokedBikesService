using System;
using AutoMapper;
using BeSpokedBikesService.ViewModel;
using BeSpokedBikesService.Model;
using System.Collections.Generic;
using System.Text;

namespace BeSpokedBikesService.TypeResolver
{
    public class AutoMapperProfile :Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<Customer, CustomerVM>().ReverseMap();
            CreateMap<Product,ProductVM>().ReverseMap();
            CreateMap<Discount,DiscountVM>().ReverseMap();
            CreateMap<Sale,SaleVM>().ReverseMap();
            CreateMap<SalesPerson,SalesPersonVM>().ReverseMap();
            
        }
    }
}
