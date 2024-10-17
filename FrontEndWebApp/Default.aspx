<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FrontEndWebApp._Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Users Gridview</title>

    <link href="Content/bootstrap.min.css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="row">
                <div class="col">
                    <h3 class="py-3">Users Gridview</h3>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="input-group mb-3">
                        <span class="input-group-text">Page Size</span>
                        <asp:DropDownList runat="server"
                            AutoPostBack="true"
                            CssClass="form-select"
                            ID="PageSizeDropDown"
                            aria-label="Select page size"
                            OnSelectedIndexChanged="PageSizeSelector_SelectedIndexChanged">
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="20">20</asp:ListItem>
                            <asp:ListItem Value="30">30</asp:ListItem>
                            <asp:ListItem Value="40">40</asp:ListItem>
                            <asp:ListItem Value="50">50</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <asp:GridView runat="server"
                        ID="UsersGridView"
                        AutoGenerateColumns="False"
                        ShowFooter="true"
                        AllowPaging="true"
                        AllowSorting="true"
                        CssClass="table"
                        OnRowEditing="UsersGridView_RowEditing"
                        OnRowUpdating="UsersGridView_RowUpdating"
                        OnRowCancelingEdit="UsersGridView_RowCancelingEdit"
                        OnRowDeleting="UsersGridView_RowDeleting"
                        OnRowCommand="UsersGridView_RowCommand"
                        OnPageIndexChanging="UsersGridView_PageIndexChanging"
                        OnSorting="UsersGridView_Sorting">

                        <Columns>

                            <asp:TemplateField HeaderText="Options">
                                <FooterTemplate>
                                    <asp:LinkButton
                                        runat="server"
                                        ID="InsertButton"
                                        CommandName="Insert"
                                        Text="Add"
                                        CssClass="btn btn-primary"
                                        ValidationGroup="Insert" />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton
                                        runat="server"
                                        ID="EditButton"
                                        CommandName="Edit"
                                        Text="Edit"
                                        CssClass="btn btn-secondary" />
                                    <asp:LinkButton
                                        runat="server"
                                        ID="DeleteButton"
                                        CommandName="Delete"
                                        Text="Delete"
                                        CssClass="btn btn-danger" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton
                                        runat="server"
                                        ID="UpdateButton"
                                        CommandName="Update"
                                        ValidationGroup="Update"
                                        Text="Update"
                                        CssClass="btn btn-primary" />
                                    <asp:LinkButton
                                        runat="server"
                                        ID="CancelButton"
                                        CommandName="Cancel"
                                        Text="Cancel"
                                        CssClass="btn btn-danger" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Full Name" ItemStyle-CssClass="align-middle" SortExpression="FirstName,LastName">
                                <ItemTemplate>
                                    <asp:Label
                                        Text='<%# Eval("FirstName") %>'
                                        runat="server" />
                                    <asp:Label
                                        Text='<%# Eval("LastName") %>'
                                        runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                <asp:TextBox
                                                    runat="server"
                                                    ID="FirstNameTextBox"
                                                    CssClass="form-control eng"
                                                    placeholder="First Name"
                                                    MaxLength="120"
                                                    Text='<%# Bind("FirstName") %>' />
                                                <div class="invalid-feedback">
                                                    <asp:CustomValidator
                                                        runat="server"
                                                        ID="FirstNameTextBox_CustomValidator"
                                                        ControlToValidate="FirstNameTextBox"
                                                        ValidateEmptyText="True"
                                                        Text="Please provide first name."
                                                        OnServerValidate="CustomValidator_ServerValidate"
                                                        ValidationGroup="Update" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <asp:TextBox
                                                    runat="server"
                                                    ID="LastNameTextBox"
                                                    CssClass="form-control eng"
                                                    placeholder="Last Name"
                                                    MaxLength="120"
                                                    Text='<%# Bind("LastName") %>' />
                                                <div class="invalid-feedback">
                                                    <asp:CustomValidator
                                                        runat="server"
                                                        ID="LastNameTextBox_CustomValidator"
                                                        ControlToValidate="LastNameTextBox"
                                                        ValidateEmptyText="True"
                                                        Text="Please provide last name."
                                                        OnServerValidate="CustomValidator_ServerValidate"
                                                        ValidationGroup="Update" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                <asp:TextBox
                                                    runat="server"
                                                    ID="InsertFirstNameTextBox"
                                                    CssClass="form-control eng"
                                                    MaxLength="120"
                                                    placeholder="First Name" />
                                                <div class="invalid-feedback">
                                                    <asp:CustomValidator
                                                        runat="server"
                                                        ID="InsertFirstNameTextBox_CustomValidator"
                                                        ControlToValidate="InsertFirstNameTextBox"
                                                        ValidateEmptyText="True"
                                                        Text="Please provide first name."
                                                        OnServerValidate="CustomValidator_ServerValidate"
                                                        ValidationGroup="Insert" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <asp:TextBox
                                                    runat="server"
                                                    ID="InsertLastNameTextBox"
                                                    CssClass="form-control eng"
                                                    MaxLength="120"
                                                    placeholder="Last Name" />
                                                <div class="invalid-feedback">
                                                    <asp:CustomValidator
                                                        runat="server"
                                                        ID="InsertLastNameTextBox_CustomValidator"
                                                        ControlToValidate="InsertLastNameTextBox"
                                                        ValidateEmptyText="True"
                                                        Text="Please provide last name."
                                                        OnServerValidate="CustomValidator_ServerValidate"
                                                        ValidationGroup="Insert" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Identity Card" ItemStyle-CssClass="align-middle" SortExpression="Identity">
                                <ItemTemplate>
                                    <asp:Label
                                        Text='<%# Eval("Identity") %>'
                                        runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox
                                        runat="server"
                                        ID="IdentityTextBox"
                                        CssClass="form-control num"
                                        placeholder="Identity Card"
                                        MaxLength="20"
                                        Text='<%# Bind("Identity") %>' />
                                    <div class="invalid-feedback">
                                        <asp:CustomValidator
                                            runat="server"
                                            ID="IdentityTextBox_CustomValidator"
                                            ControlToValidate="IdentityTextBox"
                                            ValidateEmptyText="True"
                                            Text="Please provide identity card."
                                            OnServerValidate="CustomValidator_ServerValidate"
                                            ValidationGroup="Update" />
                                    </div>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox
                                        runat="server"
                                        ID="InsertIdentityTextBox"
                                        CssClass="form-control num"
                                        placeholder="Identity Card"
                                        MaxLength="20" />
                                    <div class="invalid-feedback">
                                        <asp:CustomValidator
                                            runat="server"
                                            ID="InsertIdentityTextBox_CustomValidator"
                                            ControlToValidate="InsertIdentityTextBox"
                                            ValidateEmptyText="True"
                                            Text="Please provide identity card."
                                            OnServerValidate="CustomValidator_ServerValidate"
                                            ValidationGroup="Insert" />
                                    </div>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender" ItemStyle-CssClass="align-middle" SortExpression="Gender">
                                <ItemTemplate>
                                    <asp:Label
                                        Text='<%# Eval("Gender") %>'
                                        runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList
                                        runat="server"
                                        ID="GenderDropDownList"
                                        CssClass="form-select"
                                        SelectedValue='<%# Bind("Gender") %>'>
                                        <asp:ListItem Value="">Select gender</asp:ListItem>
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="invalid-feedback">
                                        <asp:CustomValidator
                                            runat="server"
                                            ID="GenderDropDownList_CustomValidator"
                                            ControlToValidate="GenderDropDownList"
                                            ValidateEmptyText="True"
                                            Text="Please provide gender."
                                            OnServerValidate="CustomValidator_ServerValidate"
                                            ValidationGroup="Update" />
                                    </div>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList
                                        runat="server"
                                        ID="InsertGenderDropDownList"
                                        CssClass="form-select"
                                        aria-label="Select gender">
                                        <asp:ListItem Value="">Select gender</asp:ListItem>
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="invalid-feedback">
                                        <asp:CustomValidator
                                            runat="server"
                                            ID="InsertGenderDropDownList_CustomValidator"
                                            ControlToValidate="InsertGenderDropDownList"
                                            ValidateEmptyText="True"
                                            Text="Please provide gender."
                                            OnServerValidate="CustomValidator_ServerValidate"
                                            ValidationGroup="Insert" />
                                    </div>
                                </FooterTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>
                </div>
            </div>

        </div>

    </form>

    <script>
        (function () {
            // Add english alphabet handler
            document.addEventListener('readystatechange', function () {

                // Allow only alphabet and spaces on english inputs
                document.querySelectorAll('input.eng').forEach(function (el) {

                    el.addEventListener('keypress', function (event) {
                        var ew = event.which;
                        if (ew === 32)
                            return true;
                        if (65 <= ew && ew <= 90)
                            return true;
                        if (97 <= ew && ew <= 122)
                            return true;

                        event.preventDefault();
                        return false;
                    });

                });

                // Allow only digits on numeric inputs
                document.querySelectorAll('input.num').forEach(function (el) {

                    el.addEventListener('keypress', function (event) {
                        var ew = event.which;
                        if (48 <= ew && ew <= 57)
                            return true;

                        event.preventDefault();
                        return false;
                    });

                });

            });
        })();
    </script>
</body>
</html>
