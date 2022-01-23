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
    public class SalesPersonData :ISalesPersonData
    {
        public IConfiguration configuration { get; }
        public string connectionString { get; set; }
        public SalesPersonData(IConfiguration config)
        {
            configuration = config;
            connectionString = configuration["connectionString"];
        }

        public IDbConnection GetConnection()
        {
            return new SqlConnection(this.connectionString);
        }

        public List<SalesPerson> GetAll()
        {
            using (var conn = GetConnection())
            {
                return conn.Query<SalesPerson>("GetAllSalesPerson", commandType: System.Data.CommandType.StoredProcedure).ToList();
            }
        }

        public void UpdateSalesPersonDetails(SalesPerson data)
        {
            using (var conn = this.GetConnection())
            {
                var param = new DynamicParameters();
                param.Add("@SalesPersonId", data.SalesPersonId);
                param.Add("@FirstName", data.FirstName);
                param.Add("@LastName", data.LastName);
                param.Add("@Address", data.Address);
                param.Add("@Phone", data.Phone);
                param.Add("@StartDate", data.StartDate);
                param.Add("@TerminationDate", data.TerminationDate);
                param.Add("@ManagerName", data.ManagerName);
                conn.Execute("UpdateSalesPersonById", param, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public List<SalesPerson> GetSalesPersonReport(int salesPersonId, int quarter, int year)
        {
            using(var conn=this.GetConnection())
            {
                var param = new DynamicParameters();
                param.Add("@SalesPersonId", salesPersonId);
                param.Add("@Year", quarter);
                param.Add("@quarter", year);
                return conn.Query <SalesPerson>("GetSalesPersonCommissionByQuarter", param, commandType: System.Data.CommandType.StoredProcedure).ToList();
            }
        }
    }
}
