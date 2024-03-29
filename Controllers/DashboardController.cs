﻿using _1670_API.Data;
using _1670_API.Helpers;
using _1670_API.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;

namespace _1670_API.Controllers
{
    [Route("api/dashboard")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        private readonly DataContext _dataContext;
        public DashboardController(DataContext context)
        {
            _dataContext = context;
        }

        [HttpGet]
        public async Task<ActionResult> Dashboard()
        {
            AccountDTO accountDTO = JwtHandler.ValiateToken(Request.HttpContext);
            if (accountDTO == null || accountDTO.Role == "CUSTOMER") { return StatusCode(401, "Unauthorized"); }
            if (accountDTO.Role == "STAFF" || accountDTO.Role == "MANAGER")
            {
                StatisticDTO result = _ExecuteStatisticNumber();
                return StatusCode(200, new
                {
                    revenue = result.revenue,
                    orders = result.orders,
                    users = result.users,
                });
            }

            return StatusCode(401, "Unauthorized");

        }

        private StatisticDTO _ExecuteStatisticNumber()
        {
            StatisticDTO statistic = new StatisticDTO();
            try
            {
                SqlConnection conn = Conn.Connection();
                SqlCommand cmdRevenue = new SqlCommand("PRO_TotalRevenue", conn);
                cmdRevenue.CommandType = CommandType.StoredProcedure;
                cmdRevenue.Parameters.AddWithValue("@status", "Delivered");
                conn.Open();

                SqlDataReader cmdRdRevenue = cmdRevenue.ExecuteReader();
                while (cmdRdRevenue.Read())
                {
                    var r = new
                    {
                        month = cmdRdRevenue.GetValue(0).ToString(),
                        revenue = cmdRdRevenue.GetValue(1).ToString(),
                        quantity = cmdRdRevenue.GetValue(2).ToString()
                    };
                    statistic.revenue.Add(r);
                }
                conn.Close();

                conn.Open();
                SqlCommand cmdOrders = new SqlCommand("EXEC PRO_OrderCalculating", conn);
                SqlDataReader cmdRdorders = cmdOrders.ExecuteReader();

                while (cmdRdorders.Read())
                {
                    var r = new
                    {
                        status = cmdRdorders.GetValue(0).ToString(),
                        quantity = cmdRdorders.GetValue(1).ToString()
                    };
                    statistic.orders.Add(r);
                }

                conn.Close();
                conn.Open();
                SqlCommand cmdUser = new SqlCommand("EXEC PRO_UserCalculating", conn);
                SqlDataReader cmdRdUser = cmdUser.ExecuteReader();
                while (cmdRdUser.Read())
                {
                    var r = new
                    {
                        role = cmdRdUser.GetValue(0).ToString(),
                        quantity = cmdRdUser.GetValue(1).ToString()
                    };
                    statistic.users.Add(r);
                }
                conn.Close();
                return statistic;
            }
            catch (Exception ex)
            {
                return statistic;
            }
        }
    }
}
