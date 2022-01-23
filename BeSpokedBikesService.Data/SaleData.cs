using System;
using System.Collections.Generic;
using System.Text;
using Dapper;
using BeSpokedBikesService.Model;
using BeSpokedBikesService.Contract.Data;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace BeSpokedBikesService.Data
{
    public class SaleData : ISaleData
    {
        public IConfiguration configuration { get; }
        public string connectionString { get; set; }
        public SaleData(IConfiguration config)
        {
            configuration = config;
            connectionString = configuration["connectionString"];
        }
        
        public IDbConnection GetConnection()
        {
            return new SqlConnection(this.connectionString);
        }

        public List<Sale> GetAll()
        {
            using (var conn = GetConnection())
            {
                
                var result = conn.QueryMultiple("GetAllSales", commandType: System.Data.CommandType.StoredProcedure);
                var saleList = result.Read<Sale>().ToList();
                var productList=result.Read<Product>().ToList();
                var salePerson=result.Read<SalesPerson>().ToList();
                var customerList = result.Read<Customer>().ToList();

                foreach(var sale in saleList)
                {
                  sale.Product=  productList.Where(t => t.ProductId == sale.ProductId).FirstOrDefault();
                  sale.Customer =customerList.Where(t=>t.CustomerId== sale.CustomerId).FirstOrDefault();
                  sale.SalesPerson = salePerson.Where(t => t.SalesPersonId == sale.SalespersonId).FirstOrDefault();
                }
                return saleList;



            }

        }

        public void InsertSale(Sale saleDetails)
        {
            using (var conn = this.GetConnection())
            {
                var param = new DynamicParameters();
                param.Add("@ProductId", saleDetails.ProductId);
                param.Add("@CustomerId", saleDetails.CustomerId);
                param.Add("@SalesPersonId", saleDetails.SalespersonId);
                param.Add("@Price", saleDetails.Price);
                param.Add("@SalesCommission", saleDetails.Commission);
                param.Add("@SaleDate", saleDetails.SalesDate);
                conn.Execute("AddSale", param, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
