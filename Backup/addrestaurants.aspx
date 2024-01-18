<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="addrestaurants.aspx.vb" Inherits="mountainstops.addrestaurants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="bold">
        &nbsp;</p>
    <p class="bold">
        Add a New Restaurant</p>
    <p class="bold">
        <br />
    </p>
    <p>
        Restaurant <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        Resort&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Samoens</asp:ListItem>
            <asp:ListItem>Morillon</asp:ListItem>
            <asp:ListItem>Les Carroz</asp:ListItem>
            <asp:ListItem>Sixt</asp:ListItem>
            <asp:ListItem>Flaine</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        Photo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Add restaurant" Height="28px" 
            Width="270px" />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
