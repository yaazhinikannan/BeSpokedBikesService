using System;
using System.Collections.Generic;
using System.Text;
using BeSpokedBikesService.Business;
using Microsoft.Extensions.DependencyInjection;
using BeSpokedBikesService.Contract.Business;
using BeSpokedBikesService.Contract.Data;
using BeSpokedBikesService.Data;

namespace BeSpokedBikesService.TypeResolver
{
    public static class TypeResolver
    {
        public static IServiceCollection AddDependencies(this IServiceCollection services)
        {
            services.AddTransient<ICustomerBusiness, CustomerBusiness>();
            services.AddTransient<IProductBusiness, ProductBusiness>();
            services.AddTransient<ISaleBusiness, SaleBusiness>();
            services.AddTransient<ISalesPersonBusiness, SalesPersonBusiness>();


            services.AddTransient<ICustomerData, CustomerData>();
            services.AddTransient<IProductData,ProductData>();
            services.AddTransient<ISalesPersonData, SalesPersonData > ();
            services.AddTransient<ISaleData, SaleData>();
            return services;
        }
    }
}
