Imports MySql.Data.MySqlClient
Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim intAdmin As Integer = Session("admin")

        If intAdmin = 0 Then
            Server.Transfer("~/Account/login.aspx")

        End If

        Dim email As String = Session("email")

        dsTechnicus.FilterExpression = "email <> '" + email + "'"
        dsVerkoper.FilterExpression = "email <> '" + email + "'"

    End Sub


    Protected Sub grvTechnicus_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles grvTechnicus.RowDeleting

        Dim cmd As MySqlCommand = New MySqlCommand
        Dim con As MySqlConnection = New MySqlConnection


        'gridview.DataKeys[e.RowIndex]["datakeyname"].ToString()
        Dim strEmailT As String = grvTechnicus.Rows(e.RowIndex).Cells(2).Text

        Dim strSql As String = "Select emailT from bestelt where emailT ='" + strEmailT + "'"

        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ftcConnectionstring").ToString

        cmd.Connection = con

        con.Open()

        cmd.CommandText = strSql

       

        If cmd.ExecuteScalar = Nothing Then
            e.Cancel = False

        Else

            e.Cancel = True
            lblErrorMessage.Text = "Die technicus mag niet verwijderd worden, hij moet nog een bestelling afwerken."
        End If


        con.Close()




    End Sub

    Protected Sub grvVerkoper_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles grvVerkoper.RowDeleting

        Dim cmd As MySqlCommand = New MySqlCommand
        Dim con As MySqlConnection = New MySqlConnection

        'gridview.DataKeys[e.RowIndex]["datakeyname"].ToString()
        Dim strEmailV As String = grvVerkoper.Rows(e.RowIndex).Cells(2).Text

        Dim strSql As String = "Select emailV from bestelt where emailV ='" + strEmailV + "'"

        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ftcConnectionstring").ToString

        cmd.Connection = con
        cmd.CommandText = strSql
        con.Open()



        If cmd.ExecuteScalar = Nothing Then
            e.Cancel = False

        Else

            e.Cancel = True
            lblErrorMessage.Text = "Die verkoper mag niet verwijderd worden, hij heeft een bestelling geplaatst voor een klant."
        End If


        con.Close()
    End Sub
End Class