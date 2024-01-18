<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="editprofile.aspx.vb" Inherits="mountainstops.editprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        First Name: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        Last Name: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>
    <p>
        Home Location: <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </p>
    <p>
        Ski-ing Ability:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    </p>
    <p>
        Picture: <asp:FileUpload ID="FileUpload1" runat="server" />
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Save Profile" />
    </p>
</asp:Content>
