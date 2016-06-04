<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masterpage/technicus.Master" CodeBehind="bestelling.aspx.vb" Inherits="gipWebsite.bestelling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Bestellingen</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="dsBestelling" runat="server" ConnectionString="<%$ ConnectionStrings:ftcConnectionstring %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT bestelt.* FROM bestelt" UpdateCommand="update bestelt set toestand = @toestand where bestelnr=@bestelnr"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="bestelnr" DataSourceID="dsBestelling" Height="243px" Width="800px" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="klantID" HeaderText="klantID" SortExpression="klantID" />
            <asp:BoundField DataField="computerNr" HeaderText="computerNr" SortExpression="computerNr" />
            <asp:BoundField DataField="bestelnr" HeaderText="bestelnr" SortExpression="bestelnr" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="aantal" HeaderText="aantal" SortExpression="aantal" />
            <asp:BoundField DataField="toestand" HeaderText="toestand" SortExpression="toestand" />
            <asp:BoundField DataField="extraInfo" HeaderText="extraInfo" SortExpression="extraInfo" />
            <asp:BoundField DataField="emailV" HeaderText="emailV" SortExpression="emailV" />
            <asp:BoundField DataField="emailT" HeaderText="emailT" SortExpression="emailT" ></asp:BoundField>
            <asp:BoundField DataField="afleveringsdatum" HeaderText="afleveringsdatum" SortExpression="afleveringsdatum" DataFormatString="{0:d}" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
        <EmptyDataTemplate>
            Momenteel geen bestellingen.
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>
