using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public class DataAccessLayer
{
    private readonly string _conString;
    public DataAccessLayer()
    {
        _conString =
        WebConfigurationManager.ConnectionStrings["vgrenierdb"].ConnectionString;
    }

    public DataSet GetUsers()
    {
        SqlConnection con = new SqlConnection(_conString);

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        // Call the stored procedure
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "listuser";
        SqlDataAdapter dad = new SqlDataAdapter(cmd);
        DataSet dstUsers = new DataSet();
        using (dad)
        {
            dad.Fill(dstUsers);
        }
        return dstUsers;
    }



}