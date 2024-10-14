using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEndWebApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                
                // Create 
                dt.Columns.Add("FirstName", typeof(string));
                dt.Columns.Add("LastName", typeof(string));
                dt.Columns.Add("Identity", typeof(string));
                dt.Columns.Add("Gender", typeof(string));

                // Add dummy row to show the footer when the table is empty
                dt.Rows.Add(dt.NewRow());

                UsersTable = dt;

                BindGrid();
            }
        }

        public DataTable UsersTable
        {
            get { return (DataTable)Session["Users"]; }
            set { Session["Users"] = value; }
        }

        protected void BindGrid()
        {
            UsersGridView.DataSource = UsersTable;
            UsersGridView.DataBind();

            // Hide the dummy row
            if (UsersGridView.Rows.Count > 0)
            {
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

        protected void UsersGridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            Console.WriteLine(e.Row);
        }

        protected void UsersGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Do not execute if page is invalid
            if (!Page.IsValid)
            {
                return;
            }

            if (e.CommandName == "Insert")
            {
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

        protected void Footer_Required_CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            CustomValidator customValidator = (CustomValidator)source;
            WebControl input = (WebControl)UsersGridView.FooterRow.FindControl(customValidator.ControlToValidate);

            if (string.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false;

                if (!input.CssClass.Contains("is-invalid"))
                {
                    input.CssClass += " is-invalid";
                }
            }
            else
            {
                args.IsValid = true;
                input.CssClass = input.CssClass.Replace("is-invalid", "");
            }
        }
    }
}