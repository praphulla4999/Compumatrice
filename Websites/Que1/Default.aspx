<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 50%;
        }
        .style2
        {
            width: 154px;
        }
        .style3
        {
            width: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:TextBox ID="txt_id" runat="server" Enabled="False" Visible="False"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Book Name* :-</td>
                <td class="style3">
                    <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt_name" ErrorMessage="* Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Author* :-</td>
                <td class="style3">
                    <asp:TextBox ID="txt_auth" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txt_auth" ErrorMessage="* Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Publisher* :-</td>
                <td class="style3">
                    <asp:TextBox ID="txt_publ" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txt_publ" ErrorMessage="* Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Price* :-</td>
                <td class="style3">
                    <asp:TextBox ID="txt_price" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txt_price" ErrorMessage="* Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btn_save" runat="server" Text="Save" onclick="btn_save_Click" />
                    <asp:Button ID="btn_reset" runat="server" Text="RESET" CausesValidation="False" 
                        onclick="btn_reset_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="b_id" DataSourceID="SqlDataSource1" AllowPaging="True" 
            CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5" 
            Width="788px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="b_id" HeaderText="b_id" ReadOnly="True" 
                    SortExpression="b_id" Visible="False" />
                <asp:BoundField DataField="b_name" HeaderText="Book Name" 
                    SortExpression="b_name" />
                <asp:BoundField DataField="b_auth" HeaderText="Author" 
                    SortExpression="b_auth" />
                <asp:BoundField DataField="b_publ" HeaderText="Publisher" 
                    SortExpression="b_publ" />
                <asp:BoundField DataField="b_price" HeaderText="Price(Rs.)" 
                    SortExpression="b_price" >
                <ItemStyle Width="50px" />
                </asp:BoundField>
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" 
                    ShowHeader="True" ButtonType="Image" CausesValidation="False" 
                    DeleteImageUrl="~/IMG/edit_delete_mail.png" >
                <ControlStyle Height="20px" Width="20px" />
                <ItemStyle Width="25px" />
                </asp:CommandField>
                <asp:CommandField ShowEditButton="True" 
                    ButtonType="Image" 
                    EditImageUrl="~/IMG/images.jpg" CausesValidation="False" 
                    HeaderText="Edit" >
                <ControlStyle Height="20px" Width="20px" />
                <ItemStyle Width="100px" />
                </asp:CommandField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" 
                HorizontalAlign="Center" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:CompumatriceConnectionString3 %>" 
            DeleteCommand="DELETE FROM [tbl_book] WHERE [b_id] = @original_b_id AND (([b_name] = @original_b_name) OR ([b_name] IS NULL AND @original_b_name IS NULL)) AND (([b_auth] = @original_b_auth) OR ([b_auth] IS NULL AND @original_b_auth IS NULL)) AND (([b_publ] = @original_b_publ) OR ([b_publ] IS NULL AND @original_b_publ IS NULL)) AND (([b_price] = @original_b_price) OR ([b_price] IS NULL AND @original_b_price IS NULL))" 
            InsertCommand="INSERT INTO [tbl_book] ([b_id], [b_name], [b_auth], [b_publ], [b_price]) VALUES (@b_id, @b_name, @b_auth, @b_publ, @b_price)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [tbl_book]" 
            UpdateCommand="UPDATE [tbl_book] SET [b_name] = @b_name, [b_auth] = @b_auth, [b_publ] = @b_publ, [b_price] = @b_price WHERE [b_id] = @original_b_id AND (([b_name] = @original_b_name) OR ([b_name] IS NULL AND @original_b_name IS NULL)) AND (([b_auth] = @original_b_auth) OR ([b_auth] IS NULL AND @original_b_auth IS NULL)) AND (([b_publ] = @original_b_publ) OR ([b_publ] IS NULL AND @original_b_publ IS NULL)) AND (([b_price] = @original_b_price) OR ([b_price] IS NULL AND @original_b_price IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_b_id" Type="String" />
                <asp:Parameter Name="original_b_name" Type="String" />
                <asp:Parameter Name="original_b_auth" Type="String" />
                <asp:Parameter Name="original_b_publ" Type="String" />
                <asp:Parameter Name="original_b_price" Type="Double" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="b_id" Type="String" />
                <asp:Parameter Name="b_name" Type="String" />
                <asp:Parameter Name="b_auth" Type="String" />
                <asp:Parameter Name="b_publ" Type="String" />
                <asp:Parameter Name="b_price" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="b_name" Type="String" />
                <asp:Parameter Name="b_auth" Type="String" />
                <asp:Parameter Name="b_publ" Type="String" />
                <asp:Parameter Name="b_price" Type="Double" />
                <asp:Parameter Name="original_b_id" Type="String" />
                <asp:Parameter Name="original_b_name" Type="String" />
                <asp:Parameter Name="original_b_auth" Type="String" />
                <asp:Parameter Name="original_b_publ" Type="String" />
                <asp:Parameter Name="original_b_price" Type="Double" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
    </form>
</body>
</html>
