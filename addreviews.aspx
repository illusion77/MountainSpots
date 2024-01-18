<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="addreviews.aspx.vb" Inherits="mountainstops.addreviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="bold">
        Add your restuarant review below:</p>
    <p>
        Restaurant id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="restaurantname" 
            DataValueField="restaurantid">
        </asp:DropDownList>
    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mountainspotsdb %>" 
            ProviderName="<%$ ConnectionStrings:mountainspotsdb.ProviderName %>" 
            SelectCommand="SELECT [restaurantid], [restaurantname] FROM [restaurants]">
        </asp:SqlDataSource>
    </p>
    <p>
        access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem>ski-in / ski-out</asp:ListItem>
            <asp:ListItem>push a little</asp:ListItem>
            <asp:ListItem>bit of a hike</asp:ListItem>
        </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type of restaurant&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList4" runat="server">
            <asp:ListItem>table service</asp:ListItem>
            <asp:ListItem>self service</asp:ListItem>
            <asp:ListItem>snack bar</asp:ListItem>
            <asp:ListItem>picnic room</asp:ListItem>
            <asp:ListItem>various</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        seating&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList8" runat="server" Height="22px" Width="87px">
            <asp:ListItem>inside</asp:ListItem>
            <asp:ListItem>outside</asp:ListItem>
            <asp:ListItem>both</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        cost of spag bol&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList5" runat="server" Height="25px" Width="105px">
            <asp:ListItem>0-5 euros</asp:ListItem>
            <asp:ListItem>5-10 euros</asp:ListItem>
            <asp:ListItem>10-15 euros</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        cost of coffee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList6" runat="server" Height="22px" Width="97px">
            <asp:ListItem>0-1 euros</asp:ListItem>
            <asp:ListItem>1-2 euros</asp:ListItem>
            <asp:ListItem>2-3 euros</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        cost of beer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList7" runat="server">
            <asp:ListItem>1-3 euros</asp:ListItem>
            <asp:ListItem>4-7 euros</asp:ListItem>
            <asp:ListItem>8-10 euros</asp:ListItem>
        </asp:DropDownList>
    &nbsp;</p>
    <p>
        hooks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList9" runat="server" Height="21px" Width="99px">
            <asp:ListItem>excellent</asp:ListItem>
            <asp:ListItem>ok number</asp:ListItem>
            <asp:ListItem>not enough</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; toilets&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList10" runat="server" Height="22px" Width="98px">
            <asp:ListItem>excellent</asp:ListItem>
            <asp:ListItem>ok</asp:ListItem>
            <asp:ListItem>not great</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; booking necessary&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList11" runat="server" Height="22px" Width="86px">
            <asp:ListItem>yes</asp:ListItem>
            <asp:ListItem>no</asp:ListItem>
            <asp:ListItem>probably</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        Fire
        <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
            RepeatDirection="Horizontal">
            <asp:ListItem>oui</asp:ListItem>
            <asp:ListItem>non</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p>
        Star Rating
        </p>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
            RepeatDirection="Horizontal">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem Value="3"></asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
        </asp:RadioButtonList><br />
    Choose from any of these tags: <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="tag" DataValueField="ID" 
        RepeatDirection="Horizontal">
    </asp:CheckBoxList>
     Add new tags here separated by commas: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:mountainspotsdb %>" 
        ProviderName="<%$ ConnectionStrings:mountainspotsdb.ProviderName %>" 
        SelectCommand="SELECT [ID], [tag] FROM [tags]"></asp:SqlDataSource>
      <br />
    Review<br />
    <asp:TextBox ID="TextBox3" runat="server" Height="85px" Width="634px"></asp:TextBox>
    <br />
    <p>
        <asp:Button ID="Button1" runat="server" Text="Add Review" Height="33px" 
            Width="290px" />
    </p>
</asp:Content>
