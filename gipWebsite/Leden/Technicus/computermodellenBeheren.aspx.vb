Imports MySql.Data.MySqlClient
Public Class computermodellenBeheren
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnToevoegen_Click(sender As Object, e As EventArgs) Handles btnToevoegen.Click

        If txtOmschrijving.Text = Nothing Then
            Exit Sub
        End If

        Dim cmd As MySqlCommand = New MySqlCommand
        Dim con As MySqlConnection = New MySqlConnection

        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ftcConnectionstring").ToString
        cmd.Connection = con

        Dim strSql As String = "Insert into computerModel (beschrijving) VALUES ('" + txtOmschrijving.Text + "')"

        cmd.CommandText = strSql
        con.Open()

        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            lblErrorMessage.Text = ex.Message
        End Try

        con.Close()

        If lblErrorMessage.Text = Nothing Then
            Server.Transfer("~/Leden/Technicus/computerModellenBeheren.aspx")
        End If
    End Sub
End Class