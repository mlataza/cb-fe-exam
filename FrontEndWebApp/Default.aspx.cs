using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEndWebApp
{
    public partial class _Default : Page
    {
        protected void InitUsersTable() 
        {
            var dt = new UsersDataTable();
            UsersTable = dt;
        }

        protected void InitEmptyUsersTable()
        {
            // This is a dummy data table to show the footer of the gridview
            var dt = new UsersDataTable();
            dt.Rows.Add(dt.NewRow());
            EmptyUsersTable = dt;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitEmptyUsersTable();
                InitUsersTable();
                InsertDummyData(); // Only for pagination test

                BindGrid();
            }
        }

        protected void InsertDummyData()
        {
            UsersTable.Rows.Add("Liam", "Johnson", "84723", "Male");
            UsersTable.Rows.Add("Emma", "Smith", "32904", "Female");
            UsersTable.Rows.Add("Noah", "Brown", "19576", "Male");
            UsersTable.Rows.Add("Ava", "Garcia", "48261", "Female");
            UsersTable.Rows.Add("Oliver", "Martinez", "73418", "Male");
            UsersTable.Rows.Add("Sophia", "Robinson", "56029", "Female");
            UsersTable.Rows.Add("Elijah", "Clark", "91847", "Male");
            UsersTable.Rows.Add("Mia", "Lewis", "20384", "Female");
            UsersTable.Rows.Add("Lucas", "Walker", "61572", "Male");
            UsersTable.Rows.Add("Isabella", "Hall", "47950", "Female");
            UsersTable.Rows.Add("James", "Lee", "18473", "Male");
            UsersTable.Rows.Add("Amelia", "King", "49268", "Female");
            UsersTable.Rows.Add("Benjamin", "Wright", "37016", "Male");
            UsersTable.Rows.Add("Harper", "Scott", "24950", "Female");
            UsersTable.Rows.Add("Elijah", "Young", "87412", "Male");
            UsersTable.Rows.Add("Grace", "Hill", "30271", "Female");
            UsersTable.Rows.Add("Daniel", "Adams", "65038", "Male");
            UsersTable.Rows.Add("Lily", "Baker", "81594", "Female");
            UsersTable.Rows.Add("Michael", "Gonzalez", "93604", "Male");
            UsersTable.Rows.Add("Chloe", "Nelson", "17482", "Female");
            UsersTable.Rows.Add("Alexander", "Carter", "62573", "Male");
            UsersTable.Rows.Add("Scarlett", "Mitchell", "48329", "Female");
            UsersTable.Rows.Add("Matthew", "Perez", "71825", "Male");
            UsersTable.Rows.Add("Ella", "Roberts", "53062", "Female");
            UsersTable.Rows.Add("Jacob", "Turner", "34917", "Male");
            UsersTable.Rows.Add("Victoria", "Phillips", "76150", "Female");
            UsersTable.Rows.Add("Aiden", "Campbell", "25493", "Male");
            UsersTable.Rows.Add("Aria", "Parker", "86240", "Female");
            UsersTable.Rows.Add("Samuel", "Edwards", "19475", "Male");
            UsersTable.Rows.Add("Zoey", "Collins", "47832", "Female");
            UsersTable.Rows.Add("Jackson", "Harris", "83729", "Male");
            UsersTable.Rows.Add("Avery", "Stewart", "56480", "Female");
            UsersTable.Rows.Add("Sebastian", "Flores", "98123", "Male");
            UsersTable.Rows.Add("Samantha", "Nguyen", "21874", "Female");
            UsersTable.Rows.Add("Gabriel", "Hernandez", "73012", "Male");
            UsersTable.Rows.Add("Nora", "Gonzalez", "59418", "Female");
            UsersTable.Rows.Add("Carter", "Sanders", "18574", "Male");
            UsersTable.Rows.Add("Riley", "Price", "74023", "Female");
            UsersTable.Rows.Add("Isaac", "Bennett", "98240", "Male");
            UsersTable.Rows.Add("Luna", "Wood", "21586", "Female");
            UsersTable.Rows.Add("Daniel", "Barnes", "62817", "Male");
            UsersTable.Rows.Add("Bella", "Ross", "47382", "Female");
            UsersTable.Rows.Add("Henry", "Hughes", "91658", "Male");
            UsersTable.Rows.Add("Layla", "Flores", "70429", "Female");
            UsersTable.Rows.Add("Mason", "Ward", "84750", "Male");
            UsersTable.Rows.Add("Sofia", "Peterson", "32901", "Female");
            UsersTable.Rows.Add("Levi", "Gray", "24893", "Male");
            UsersTable.Rows.Add("Mila", "James", "87014", "Female");
            UsersTable.Rows.Add("Owen", "Cruz", "56231", "Male");
            UsersTable.Rows.Add("Arlo", "Simmons", "19764", "Male");
            UsersTable.Rows.Add("Hazel", "Kelley", "84927", "Female");
            UsersTable.Rows.Add("Wyatt", "Butler", "46012", "Male");
            UsersTable.Rows.Add("Charlotte", "Fisher", "21367", "Female");
            UsersTable.Rows.Add("Eli", "Diaz", "90834", "Male");
            UsersTable.Rows.Add("Skylar", "Richardson", "37419", "Female");
            UsersTable.Rows.Add("Asher", "Kim", "62574", "Male");
            UsersTable.Rows.Add("Emily", "Cox", "21573", "Female");
            UsersTable.Rows.Add("Cooper", "Howard", "95742", "Male");
            UsersTable.Rows.Add("Victoria", "Ward", "63480", "Female");
            UsersTable.Rows.Add("Jackson", "Knight", "38261", "Male");
            UsersTable.Rows.Add("Lydia", "Scott", "19528", "Female");
            UsersTable.Rows.Add("Finn", "Long", "76214", "Male");
            UsersTable.Rows.Add("Sienna", "Henderson", "40819", "Female");
            UsersTable.Rows.Add("Leo", "Harrison", "32985", "Male");
            UsersTable.Rows.Add("Zara", "McDonald", "14726", "Female");
        }

        public UsersDataTable UsersTable
        {
            get { return (UsersDataTable)Session["Users"]; }
            set { Session["Users"] = value; }
        }

        public UsersDataTable EmptyUsersTable
        {
            get { return (UsersDataTable)Session["EmptyUsers"]; }
            set { Session["EmptyUsers"] = value; }
        }

        protected string BuildSortExpression(string sortExpression, string sortDirection)
        {
            var expression = "";

            foreach (var column in sortExpression.Split(','))
            {
                expression += ", " + column + " " + sortDirection;
            }

            return expression.Substring(2);
        }

        protected void BindGrid(string sortExpression = null)
        {
            if (UsersTable.Rows.Count > 0)
            {
                if (sortExpression == null)
                {
                    UsersGridView.DataSource = UsersTable;
                }
                else
                {
                    // Flip the sort direction
                    SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";

                    // Use a DataView to sort the data
                    var dv = UsersTable.AsDataView();
                    dv.Sort = BuildSortExpression(sortExpression, SortDirection);
                    UsersGridView.DataSource = dv;
                }

                UsersGridView.DataBind();
            }
            else
            {
                UsersGridView.DataSource = EmptyUsersTable;
                UsersGridView.DataBind();
                UsersGridView.Rows[0].Visible = false;
            }        
        }

        protected void UsersGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            UsersGridView.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void UsersGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var dt = UsersTable;

            GridViewRow row = UsersGridView.Rows[e.RowIndex];
            DataRow dataRow = dt.Rows[row.DataItemIndex];

            dataRow["FirstName"] = ((TextBox)row.FindControl("FirstNameTextBox")).Text;
            dataRow["LastName"] = ((TextBox)row.FindControl("LastNameTextBox")).Text;
            dataRow["Identity"] = ((TextBox)row.FindControl("IdentityTextBox")).Text;
            dataRow["Gender"] = ((DropDownList)row.FindControl("GenderDropDownList")).SelectedValue;

            UsersGridView.EditIndex = -1;
            BindGrid();
        }

        protected void UsersGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            UsersGridView.EditIndex = -1;
            BindGrid();
        }

        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var dt = UsersTable;

            GridViewRow row = UsersGridView.Rows[e.RowIndex];
            dt.Rows.RemoveAt(row.DataItemIndex);
            BindGrid();
        }

        protected void UsersGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                // Do not execute if page is invalid
                if (!Page.IsValid)
                {
                    return;
                }

                UsersTable.Rows.Add(
                    InsertFirstNameTextBox.Text, 
                    InsertLastNameTextBox.Text,
                    InsertIdentityTextBox.Text,
                    InsertGenderDropDownList.SelectedValue);
                BindGrid();
            }
        }

        public TextBox InsertFirstNameTextBox => (TextBox)UsersGridView.FooterRow.FindControl("InsertFirstNameTextBox");

        public TextBox InsertLastNameTextBox => (TextBox)UsersGridView.FooterRow.FindControl("InsertLastNameTextBox");

        public TextBox InsertIdentityTextBox => (TextBox)UsersGridView.FooterRow.FindControl("InsertIdentityTextBox");

        public DropDownList InsertGenderDropDownList => (DropDownList)UsersGridView.FooterRow.FindControl("InsertGenderDropDownList");

        protected void CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            CustomValidator customValidator = (CustomValidator)source;
            WebControl input = (WebControl)customValidator.FindControl(customValidator.ControlToValidate);

            // Check if data is empty
            if (string.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;

                if (!input.CssClass.Contains("is-invalid"))
                {
                    input.CssClass += " is-invalid";
                }

                return;
            }
            
            // Input is valid
            args.IsValid = true;
            input.CssClass = input.CssClass.Replace("is-invalid", "");
        }

        protected void UsersGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            UsersGridView.EditIndex = -1;
            UsersGridView.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void PageSizeSelector_SelectedIndexChanged(object sender, EventArgs e)
        {
            UsersGridView.PageSize = Int32.Parse((sender as DropDownList).SelectedValue);
            BindGrid();
        }

        protected string SortDirection
        {
            get { return (ViewState["SortDirection"] as string) ?? "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }

        protected void UsersGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            BindGrid(e.SortExpression);
        }
    }
}