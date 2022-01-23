using System;
using System.Collections.Generic;
using System.Text;
using BeSpokedBikesService.Model;
namespace BeSpokedBikesService.Contract.Data
{
    public interface ISaleData
    {
        List<Sale> GetAll();
        void InsertSale(Sale saleDetails);


    }
}
