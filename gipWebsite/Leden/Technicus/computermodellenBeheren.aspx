<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masterpage/technicus.Master" CodeBehind="computermodellenBeheren.aspx.vb" Inherits="gipWebsite.computermodellenBeheren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="dsComputerModel" runat="server" ConnectionString="<%$ ConnectionStrings:ftcConnectionstring %>" DeleteCommand="delete from computerModel where computerNr=@computerNr" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT computerNr, beschrijving FROM computerModel" UpdateCommand="update computerModel set beschrijving=@beschrijving where computerNr=@computerNr"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="computerNr" DataSourceID="dsComputerModel">
        <Columns>
            <asp:BoundField DataField="computerNr" HeaderText="computerNr" InsertVisible="False" ReadOnly="True" SortExpression="computerNr" />
            <asp:BoundField DataField="beschrijving" HeaderText="beschrijving" SortExpression="beschrijving" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <EmptyDataTemplate>
            Geen computermodellen.
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:Panel ID="panelModel" runat="server">
        <fieldset>
            <legend>Nieuw model toevoegen</legend>
            <label for="omschrijving" runat="server">Omschrijving</label>
            <asp:TextBox ID="txtOmschrijving" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnToevoegen" runat="server" text="Toevoegen"/>
            <br />
        
        </fieldset>
        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
    </asp:Panel>
</asp:Content>
