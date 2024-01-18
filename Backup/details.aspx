<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="details.aspx.vb" Inherits="mountainstops.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    <br />
</p>

<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="reviewid" DataSourceID="SqlDataSource1" CssClass="grid" 
        Width="810px" Height="190px">
        <Columns>
            <asp:BoundField DataField="memberid" HeaderText="Member" 
                SortExpression="memberid" >
            </asp:BoundField>
            <asp:BoundField DataField="access" HeaderText="Access" 
                SortExpression="access" />
            <asp:BoundField DataField="typeofrestaurant" HeaderText="Type" 
                SortExpression="typeofrestaurant" />
            <asp:BoundField DataField="costspagbol" HeaderText="Spag Bol" 
                SortExpression="costspagbol" />
            <asp:BoundField DataField="costcoffee" HeaderText="Coffee" 
                SortExpression="costcoffee" />
            <asp:BoundField DataField="costbeer" HeaderText="Beer" 
                SortExpression="costbeer" />
            <asp:BoundField DataField="seating" HeaderText="Seating" 
                SortExpression="seating" />
            <asp:BoundField DataField="fire" HeaderText="Fire" />
            <asp:BoundField DataField="hooks" HeaderText="Hooks" 
                SortExpression="hooks" />
            <asp:BoundField DataField="bookingnecessary" HeaderText="Book?" 
                SortExpression="bookingnecessary" />
            <asp:BoundField DataField="toilets" HeaderText="Toilets" 
                SortExpression="toilets" />
            <asp:TemplateField HeaderText="Stars">
            <ItemTemplate><h1><%# getstars(Eval("stars"))%></h1></ItemTemplate></asp:TemplateField>
            <asp:BoundField DataField="review" HeaderText="Review" 
                SortExpression="review" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mountainspotsdb %>" 
        ProviderName="<%$ ConnectionStrings:mountainspotsdb.ProviderName %>" 
        SelectCommand="SELECT * FROM [reviews] WHERE ([restaurantid] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="restaurantid" QueryStringField="restaurantid" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
<p>
</p>
<p>
</p>
</asp:Content>
