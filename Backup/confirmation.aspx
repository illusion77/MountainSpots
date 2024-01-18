<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="confirmation.aspx.vb" Inherits="mountainstops.confirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p><span style="font-size:12.5pt;font-family:&quot;Segoe UI&quot;,&quot;sans-serif&quot;;color:blue">
    <br />
        Thank you for adding to this site.</p>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/list.aspx">Back to list of restuarants</asp:HyperLink>
    </p>
</asp:Content>
