<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masterpage/beheerder.master" CodeBehind="AccountBeheer.aspx.vb" Inherits="gipWebsite.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Account beheer</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:SqlDataSource ID="dsTechnicus" runat="server" ConnectionString="<%$ ConnectionStrings:ftcConnectionstring %>" DeleteCommand="delete from technicus where email =@email" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT naam, email, voornaam, admin FROM technicus" UpdateCommand="UPDATE technicus SET naam =@naam, voornaam=@voornaam, admin=@admin where email =@email"></asp:SqlDataSource>
    <div >
        <asp:SqlDataSource ID="dsVerkoper" runat="server" ConnectionString="<%$ ConnectionStrings:ftcConnectionstring %>" DeleteCommand="delete from verkoper where email =@email" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT naam, email, voornaam, admin FROM verkoper" UpdateCommand="UPDATE verkoper SET naam =@naam, voornaam=@voornaam, admin=@admin where email = @email"></asp:SqlDataSource>
        <asp:Label ID="lblTechnicus" runat="server" Text="Technicus"></asp:Label>
        <asp:GridView ID="grvTechnicus" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="email" DataSourceID="dsTechnicus">
            <Columns>
                <asp:BoundField DataField="naam" HeaderText="naam" SortExpression="naam" />
                <asp:BoundField DataField="voornaam" HeaderText="voornaam" SortExpression="voornaam" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" ReadOnly="True" />
                <asp:CheckBoxField DataField="admin" HeaderText="admin" SortExpression="admin" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <EmptyDataTemplate>
                Geen technici
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        <asp:Label ID="lblVerkoper" runat="server" Text="Verkoper"></asp:Label>
        <asp:GridView ID="grvVerkoper" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="email" DataSourceID="dsVerkoper">
            <Columns>
                <asp:BoundField DataField="naam" HeaderText="naam" SortExpression="naam" />
                <asp:BoundField DataField="voornaam" HeaderText="voornaam" SortExpression="voornaam" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" ReadOnly="True" />
                <asp:CheckBoxField DataField="admin" HeaderText="admin" SortExpression="admin" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <EmptyDataTemplate>
                Geen verkopers
            </EmptyDataTemplate>
        </asp:GridView>
        <br />
        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
    </div>

</asp:Content>
