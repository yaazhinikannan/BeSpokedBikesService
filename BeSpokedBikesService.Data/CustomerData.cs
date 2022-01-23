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
    public class CustomerData :ICustomerData
    {
        public IConfiguration configuration { get; }
        public string connectionString { get; set; }
        public CustomerData(IConfiguration config)
        {
            configuration = config;
            connectionString = configuration["connectionString"];
        }

        public IDbConnection GetConnection()
        {
            return new SqlConnection(this.connectionString);
        }

        public List<Customer> GetAll()
        {
            using(var conn = GetConnection())
            {
                return conn.Query<Customer>("GetAllCustomers",commandType:System.Data.CommandType.StoredProcedure).ToList();
            }
        }
    }
}
