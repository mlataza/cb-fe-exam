<%@ Page Language="C#" %>

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
                    <asp:GridView ID="UsersGridView"
                        DataSourceID="UsersSqlDataSource"
                        DataKeyNames="Id"
                        AutoGenerateColumns="False"
                        runat="server"
                        CssClass="table">

                        <Columns>

                            <asp:CommandField
                                ShowEditButton="true"
                                ShowDeleteButton="true"
                                HeaderText="Actions" />

                            <asp:TemplateField HeaderText="Full Name">
                                <ItemTemplate>
                                    <asp:Label
                                        Text='<%# Eval("FirstName") %>'
                                        runat="server" />
                                    <asp:Label
                                        Text='<%# Eval("LastName") %>'
                                        runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="FirstNameTextBox" Text='<%# Bind("FirstName") %>' />
                                    <asp:TextBox runat="server" ID="LastNameTextBox" Text='<%# Bind("LastName") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="Identity"
                                HeaderText="Identity Card"
                                SortExpression="Identity" />

                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:Label
                                        Text='<%# Eval("Gender") %>'
                                        runat="server" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList
                                        runat="server"
                                        ID="GenderDropDownList"
                                        SelectedValue='<%# Bind("Gender") %>'>
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>
                </div>
            </div>

        </div>

        <!-- This example uses Microsoft SQL Server and connects -->
        <!-- to the Pubs sample database.                        -->
        <asp:SqlDataSource ID="UsersSqlDataSource"
            SelectCommand="SELECT * FROM [dbo].[Users]"
            UpdateCommand="Update [dbo].[Users] SET [FirstName]=@FirstName, [LastName]=@LastName, [Identity]=@Identity, [Gender]=@Gender WHERE [Id]=@Id"
            ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\GuestUser\source\repos\mlataza\cb-fe-exam\FrontEndWebApp\App_Data\MainDatabase.mdf;Integrated Security=True"
            runat="server"></asp:SqlDataSource>

    </form>
</body>
</html>
