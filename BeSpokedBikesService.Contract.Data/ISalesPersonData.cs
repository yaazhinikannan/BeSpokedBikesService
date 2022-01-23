using System;
using System.Collections.Generic;
using System.Text;
using BeSpokedBikesService.Model;

namespace BeSpokedBikesService.Contract.Data
{
    public interface ISalesPersonData
    {
        List<SalesPerson> GetAll();
        void UpdateSalesPersonDetails(SalesPerson data);
        List<SalesPerson> GetSalesPersonReport(int salesPersonId, int quarter, int year);
    }
}
