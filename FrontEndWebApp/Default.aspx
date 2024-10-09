<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FrontEndWebApp._Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
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
                    <asp:GridView runat="server"
                        ID="UsersGridView"
                        AutoGenerateColumns="False"
                        ShowFooter="true"
                        CssClass="table"
                        OnRowEditing="UsersGridView_RowEditing"
                        OnRowUpdating="UsersGridView_RowUpdating"
                        OnRowCancelingEdit="UsersGridView_RowCancelingEdit"
                        OnRowDeleting="UsersGridView_RowDeleting"
                        OnRowCreated="UsersGridView_RowCreated"
                        OnRowCommand="UsersGridView_RowCommand">

                        <Columns>

                            <asp:TemplateField HeaderText="Options">
                                <FooterTemplate>
                                    <asp:LinkButton 
                                        runat="server"
                                        ID="InsertButton"
                                        CommandName="Insert"
                                        Text="Add" 
                                        CssClass="btn btn-primary"/>
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

                            <asp:TemplateField HeaderText="Full Name" ItemStyle-CssClass="align-middle">
                                <ItemTemplate>
                                    <asp:Label
                                        Text='<%# Eval("FirstName") %>'
                                        runat="server" />
                                    <asp:Label
                                        Text='<%# Eval("LastName") %>'
                                        runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="input-group">
                                        <asp:TextBox 
                                            runat="server" 
                                            ID="FirstNameTextBox" 
                                            CssClass="form-control eng"
                                            placeholder="First Name"
                                            maxlength="120"
                                            Text='<%# Bind("FirstName") %>' />
                                        <asp:TextBox 
                                            runat="server" 
                                            ID="LastNameTextBox" 
                                            CssClass="form-control eng"
                                            placeholder="Last Name"
                                            maxlength="120"
                                            Text='<%# Bind("LastName") %>' />
                                    </div>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <div class="input-group">
                                        <asp:TextBox
                                            runat="server"
                                            ID="InsertFirstNameTextBox"
                                            CssClass="form-control eng"
                                            maxlength="120"
                                            placeholder="First Name" />
                                        <asp:TextBox
                                            runat="server"
                                            ID="InsertLastNameTextBox"
                                            CssClass="form-control eng"
                                            maxlength="120"
                                            placeholder="Last Name" />
                                    </div>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Identity Card" ItemStyle-CssClass="align-middle">
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
                                        maxlength="20"
                                        Text='<%# Bind("Identity") %>' />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox 
                                        runat="server" 
                                        ID="InsertIdentityTextBox"
                                        CssClass="form-control num"
                                        placeholder="Identity Card"
                                        maxlength="20"/>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender" ItemStyle-CssClass="align-middle">
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
