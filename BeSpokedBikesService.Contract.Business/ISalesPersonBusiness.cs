using System;
using System.Collections.Generic;
using System.Text;
using BeSpokedBikesService.ViewModel;


namespace BeSpokedBikesService.Contract.Business
{
    public interface ISalesPersonBusiness
    {
        List<SalesPersonVM> GetAll();
        void UpdateSalesPersonDetails(SalesPersonVM data);
        List<SalesPersonVM> GetSalesPersonReport(int salesPersonId, int quarter, int year);
    }
}
