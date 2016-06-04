<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masterpage/verkoper.Master" CodeBehind="klantenBeheren.aspx.vb" Inherits="gipWebsite.klantenBeheren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="dsKlanten" runat="server" ConnectionString="<%$ ConnectionStrings:ftcConnectionstring %>" DeleteCommand="delete from klant where klantID = @klantID
" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT klantID, naam, voornaam, telefoonnr, adres FROM klant " UpdateCommand="UPDATE klant SET naam = @naam, voornaam =@voornaam, telefoonnr=@telefoonnr, adres = @adres
where klantID= @klantID"></asp:SqlDataSource>
    <asp:GridView ID="grvKlanten" runat="server" AllowPaging="True" OnRowDataBound="grvKlanten_RowDataBound" AutoGenerateColumns="False" DataKeyNames="klantID" DataSourceID="dsKlanten">
        <Columns>
            <asp:BoundField DataField="klantID" HeaderText="klantID" ReadOnly="True" SortExpression="klantID" InsertVisible="False" />
            <asp:BoundField DataField="naam" HeaderText="naam" SortExpression="naam" />
            <asp:BoundField DataField="voornaam" HeaderText="voornaam" SortExpression="voornaam" />
            <asp:BoundField DataField="telefoonnr" HeaderText="telefoonnr" SortExpression="telefoonnr" />
            <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <EmptyDataTemplate>
            Momenteel geen klanten.
           
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:Button ID="btnNieuweKlant1" runat="server" Text="Nieuwe klant" />
    <br />
    <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
    <br />
    <asp:Panel ID="panelKlant" Visible="false" runat="server">     
        <fieldset>
                <legend>Voeg een nieuwe klant toe</legend>
                <label for="txtnaam" >Naam</label>
                <asp:TextBox  runat="server" id="txtnaam"  />
                <br />
                <label for="txtvoornaam">Voornaam</label>
                <asp:TextBox   runat="server" id="txtvoornaam" />
                <br />
                <label= for="txttelefoonnr">Telefoon</label>
                <asp:TextBox   runat="server" id="txttelefoonnr" />
                <br />
                 <label for="txtadres">Adres</label>
                <asp:TextBox   runat="server" id ="txtadres" />
                <br />
                <asp:Button ID="btnNieuweKlant" runat="server" Text="Nieuwe klant" OnClick="btnNieuweKlant_Click" PostBackUrl="~/Leden/Verkoper/klantenBeheren.aspx" />
                 </fieldset>

</asp:Panel>
</asp:Content>
