<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="restaurantsbytag.aspx.vb" Inherits="mountainstops.restaurantsbytag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CssClass="grid" Width="766px" AllowSorting="True" OnSorting="GridView1_Sorting">
    <Columns>
        <asp:BoundField DataField="restaurantname" HeaderText="Restaurant" 
            SortExpression="restaurantname" />
        <asp:BoundField DataField="resort" HeaderText="resort" 
            SortExpression="resort" />
        <asp:ImageField DataImageUrlField="pic" HeaderText="Photo">
            <ControlStyle CssClass="photosize" />
            <ItemStyle Width="100px" />
        </asp:ImageField>
        <asp:HyperLinkField DataNavigateUrlFields="restaurantid" 
            DataNavigateUrlFormatString="details.aspx?restaurantid={0}" 
            HeaderText="See reviews" Text="See reviews" />
        <asp:BoundField DataField="views" HeaderText="views" SortExpression="views" />
    </Columns>
</asp:GridView>
</asp:Content>
