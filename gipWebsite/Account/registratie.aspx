<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masterpage/beheerder.Master" CodeBehind="registratie.aspx.vb" Inherits="gipWebsite.registratie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Nieuwe gebruiker</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <fieldset class="panel panel-default" style="margin: 20px">
        <legend class="panel-heading">Voer de gegevens van het nieuwe lid in: </legend>
        
        <label for="naam" >Naam</label>
        <input type="text" class="input-group-sm" required="required" placeholder="Naam" id="naam" runat="server" />
        <br />

        <label for="voornaam">Voornaam</label>
        <input type="text" class="input-group-sm" required="required" placeholder="Voornaam" id="voornaam" runat="server" />
        <br />

        <label for="email" >Email</label>
        <input type="email" class="input-group-sm" required="required" placeholder="Email" id="email" runat="server" />
        <br />

        <label for="wachtwoord" >Wachtwoord</label>
        <input type="password" class="input-group-sm" required="required" placeholder="Wachtwoord" id="wachtwoord" runat="server" />
        <br />

        <label for="wachtwoordBevestigen" >Wachtwoord bevestigen</label>
        <input type="password" class="input-group-sm" required="required" placeholder="Wachtwoord bevestigen" id="wachtwoordbevestigen" runat="server" />
        <br />

        <label for="rol" >Rol</label>
        <input type="text" class="input-group-sm" required="required" placeholder="Verkoper/Technicus" id ="rol" runat="server" />
        <br />
        <label for="beheerder">Beheerder</label>
        <asp:CheckBox ID="ckbBeheerder" runat="server" />
        <br />
        <asp:Label ID="lblErrormessage" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnNieuweGebruiker"  CssClass="btn btn-primary" runat="server" Text="Maak gebruiker" OnClick="btnNieuweGebruiker_Click" PostBackUrl="~/Account/registratie.aspx" />

    </fieldset>
</asp:Content>
