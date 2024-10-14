using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FrontEndWebApp
{
    public class UsersDataTable : DataTable
    {
        public UsersDataTable()
        {
            // Create the columns
            Columns.Add("FirstName", typeof(string));
            Columns.Add("LastName", typeof(string));
            Columns.Add("Identity", typeof(string));
            Columns.Add("Gender", typeof(string));
        }

    }
}