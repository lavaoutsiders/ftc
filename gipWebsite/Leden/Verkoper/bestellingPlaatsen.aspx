<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masterpage/verkoper.Master" CodeBehind="bestellingPlaatsen.aspx.vb" Inherits="gipWebsite.bestellingPlaatsen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="dsBestelling" runat="server" ConnectionString="<%$ ConnectionStrings:ftcConnectionstring %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT klantID, computerNr, bestelnr, aantal, toestand, extraInfo, emailV, emailT, afleveringsdatum FROM bestelt" UpdateCommand="UPDATE bestelt SET klantID= klantID, computerNr=@computerNr, aantal=@aantal,toestand=@toestand,extraInfo=@extraInfo, emailV=@emailV,emailT=@emailT,afleveringsdatum=@afleveringsdatum" DeleteCommand="delete from bestelt where bestelnr= @bestelnr"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsKlanten" runat="server" ConnectionString="<%$ ConnectionStrings:ftcConnectionstring %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT klantID, naam, voornaam FROM klant"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsModel" runat="server" ConnectionString="<%$ ConnectionStrings:ftcConnectionstring %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT computerNr, beschrijving FROM computerModel"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsTechnicus" runat="server" ConnectionString="<%$ ConnectionStrings:ftcConnectionstring %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT naam, voornaam, email FROM technicus"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsVerkoper" runat="server" ConnectionString="<%$ ConnectionStrings:ftcConnectionstring %>" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT naam, voornaam, email FROM verkoper"></asp:SqlDataSource>
    <asp:GridView ID="grvBestelling" runat="server" AutoGenerateColumns="False" DataKeyNames="bestelnr" DataSourceID="dsBestelling" style="margin-top: 0px" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="klantID" HeaderText="klantID" SortExpression="klantID" />
            <asp:BoundField DataField="computerNr" HeaderText="computerNr" SortExpression="computerNr" />
            <asp:BoundField DataField="bestelnr" HeaderText="bestelnr" InsertVisible="False" ReadOnly="True" SortExpression="bestelnr" />
            <asp:BoundField DataField="aantal" HeaderText="aantal" SortExpression="aantal" />
            <asp:BoundField DataField="toestand" HeaderText="toestand" SortExpression="toestand" />
            <asp:BoundField DataField="extraInfo" HeaderText="extraInfo" SortExpression="extraInfo" />
            <asp:BoundField DataField="emailV" HeaderText="emailV" SortExpression="emailV" />
            <asp:BoundField DataField="emailT" HeaderText="emailT" SortExpression="emailT" />
            <asp:TemplateField HeaderText="afleveringsdatum" SortExpression="afleveringsdatum">
                <EditItemTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("afleveringsdatum") %>'></asp:Calendar>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("afleveringsdatum", "{0:yyyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <EmptyDataTemplate>
            Geen bestellingen
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:panel ID="panelBestellingPlaatsen" visible="true" runat="server">
        <fieldset>
            <legend>Nieuwe bestelling</legend>
            <label for="klant">Klant</label>
            <asp:DropDownList ID="dpdKlanten" runat="server" DataSourceID="dsKlanten" DataTextField="naam" DataValueField="klantID"></asp:DropDownList>
            <br />
            <label for="model">Model</label>
            <asp:DropDownList ID="dpdModel" runat="server" DataSourceID="dsModel" DataTextField="beschrijving" DataValueField="computerNr"></asp:DropDownList>
            <br />
            <label for="aantal">Aantal</label>
            <asp:TextBox ID="txtAantal" runat="server"></asp:TextBox>
            <br />
            <label for="extraInfo">Extra info</label>
            <asp:TextBox ID="txtExtraInfo" runat="server"></asp:TextBox>
            <br />
            <label for ="verkoper" runat="server">Geplaatst door</label>
               <asp:DropDownList ID="dpdVerkoper" runat="server" DataSourceID="dsVerkoper" DataTextField="naam" DataValueField="email" AutoPostBack="True"></asp:DropDownList>
            <br />
             <label for ="technicus" runat="server">Geef door aan</label>
               <asp:DropDownList ID="dpdTechnicus" runat="server" DataSourceID="dsTechnicus" DataTextField="naam" DataValueField="email"></asp:DropDownList>
            <br />
            <label for="aflevering" runat="server">Afleveringsdatum</label>
            <asp:Calendar ID="afleveringsdatum" runat="server"></asp:Calendar>
            
            <br />
                <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
           
            
           
                <br />
            <label for="afleveringsdatum">
            </label>
            <asp:Button ID="btnNieuweBestelling" runat="server" Text="Bevestigen" />
           
            
           
                </fieldset>

    </asp:panel>
    
</asp:Content>
