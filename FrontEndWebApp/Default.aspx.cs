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

                BindGrid();
            }
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

        protected void BindGrid()
        {
            if (UsersTable.Rows.Count > 0)
            {
                UsersGridView.DataSource = UsersTable;
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
    }
}