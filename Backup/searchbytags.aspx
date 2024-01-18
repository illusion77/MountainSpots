<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="searchbytags.aspx.vb" Inherits="mountainstops.searchbytags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" CssClass="grid" Width="139px">
    <Columns>
        <asp:HyperLinkField DataNavigateUrlFields="tag" 
            DataNavigateUrlFormatString="restaurantsbytag.aspx?tag={0}" DataTextField="tag" 
            HeaderText="Search for:" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:mountainspotsdb %>" 
    ProviderName="<%$ ConnectionStrings:mountainspotsdb.ProviderName %>" 
    SelectCommand="SELECT [tag] FROM [tags]"></asp:SqlDataSource>
</asp:Content>
