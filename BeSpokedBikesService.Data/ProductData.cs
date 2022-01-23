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
    public class ProductData :IProductData
    {
        public IConfiguration configuration { get; }
        public string connectionString { get; set; }
        public ProductData(IConfiguration config)
        {
            configuration = config;
            connectionString = configuration["connectionString"];
        }

        public IDbConnection GetConnection()
        {
            return new SqlConnection(this.connectionString);
        }

        public List<Product> GetAll()
        {
            using (var conn = GetConnection())
            {
                return conn.Query<Product>("GetAllProducts", commandType: System.Data.CommandType.StoredProcedure).ToList();
            }
        }

        public void UpdateProductDetails(Product data)
        {
            using(var conn =this.GetConnection())
            {
                var param = new DynamicParameters();
                param.Add("@ProductId",data.ProductId);
                param.Add("@ProductName", data.ProductName);
                param.Add("@Manufacturer", data.Manufacturer);
                param.Add("@Style", data.Style);
                param.Add("@PurchasePrice", data.PurchasePrice);
                param.Add("@SalePrice", data.SalePrice);
                param.Add("@QtyOnHand", data.QtyOnHand);
                param.Add("@CommissionPercentage", data.CommissionPercentage);
                conn.Execute("UpdateProductByProductId", param, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
