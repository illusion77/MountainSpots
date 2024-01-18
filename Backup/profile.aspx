<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="profile.aspx.vb" Inherits="mountainstops.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="firstname" HeaderText="firstname" 
                SortExpression="firstname" />
            <asp:BoundField DataField="lastname" HeaderText="lastname" 
                SortExpression="lastname" />
            <asp:BoundField DataField="homelocation" HeaderText="homelocation" 
                SortExpression="homelocation" />
            <asp:BoundField DataField="skiername" HeaderText="skiername" 
                SortExpression="skiername" />
            <asp:BoundField DataField="ability" HeaderText="ability" 
                SortExpression="ability" />
            <asp:ImageField DataImageUrlField="picture" DataImageUrlFormatString="{0}">
                <ControlStyle CssClass="photosize" />
            </asp:ImageField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mountainspotsdb %>" 
        ProviderName="<%$ ConnectionStrings:mountainspotsdb.ProviderName %>" 
        SelectCommand="SELECT [id], [firstname], [lastname], [homelocation], [skiername], [ability], [picture] FROM [members] WHERE ([skiername] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="skiername" QueryStringField="skiername" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" PostBackUrl="~/editprofile.aspx" 
        Text="Edit Profile" />
    <br />
</asp:Content>
