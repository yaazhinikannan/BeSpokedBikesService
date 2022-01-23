using System;
using System.Collections.Generic;
using System.Text;
using BeSpokedBikesService.ViewModel;

namespace BeSpokedBikesService.Contract.Business
{
    public interface ISaleBusiness
    {
        List<SaleVM> GetAll();
        void InsertSale(SaleVM saleDetails);
    }
}
