<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="list.aspx.vb" Inherits="mountainstops.list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>&nbsp;</p>
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" 
            OnSorting="GridView1_Sorting"
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="restaurantid" 
            Width="807px" CssClass="grid">
            <Columns>
                <asp:BoundField DataField="restaurantname" HeaderText="Restaurant" 
                    SortExpression="restaurantname" />
                <asp:BoundField DataField="resort" HeaderText="Resort" 
                    SortExpression="resort" />
                <asp:ImageField DataImageUrlField="pic" HeaderText="Photo">
                    <ControlStyle CssClass="photosize" />
                    <ItemStyle Width="100px" />
                </asp:ImageField>
                <asp:HyperLinkField DataNavigateUrlFields="restaurantid" 
                    DataNavigateUrlFormatString="details.aspx?restaurantid={0}" 
                    HeaderText="Reviews" Text="See Reviews" />
                <asp:BoundField DataField="views" HeaderText="Views" SortExpression="views" />
            </Columns>
        </asp:GridView>
    </p>
    <p>&nbsp;</p>
</asp:Content>
