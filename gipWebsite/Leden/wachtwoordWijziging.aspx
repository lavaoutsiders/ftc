<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masterpage/Site1.Master" CodeBehind="wachtwoordWijziging.aspx.vb" Inherits="gipWebsite.wachtwoordWijziging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="wachtwoordWijzigen" runat="server">
        <label for="lblOudWachtwoord" runat="server">Oud wachtwoor</label>
        <asp:TextBox ID="txtOudWachtwoord" TextMode="Password" runat="server"></asp:TextBox>
        <br />
        <label for="lblNieuwWachtwoord" runat="server">Nieuw wachtwoord</label>
        <asp:TextBox ID="txtNieuwWachtwoord" TextMode="Password" runat="server"></asp:TextBox>
        <br />
        <label for="lblWachtwoordBevestigen" runat="server">Wachtwoord bevestigen</label>
        <asp:TextBox ID="txtWachtwoordBevestigen" TextMode="Password" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnWachtwoordBevestigen" runat="server" Text="Bevestigen"/>
        

    </asp:Panel>
</asp:Content>
