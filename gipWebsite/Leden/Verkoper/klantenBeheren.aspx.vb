Imports MySql.Data.MySqlClient
Public Class klantenBeheren
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If grvKlanten.Rows.Count() = 0 Then
            panelKlant.Visible = True
        Else
            panelKlant.Visible = False
        End If

        If panelKlant.Visible = True Then
            btnNieuweKlant1.Visible = False
        End If

    End Sub

    Protected Sub btnToevoegen_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnNieuweKlant_Click(sender As Object, e As EventArgs)

        lblErrorMessage.Text = ""

        panelKlant.Visible = True

        Dim boolTelefoonnr As Boolean = IsNumeric(txttelefoonnr.Text)

        If txtnaam.Text = Nothing Then
            lblErrorMessage.Text = "Gelieve een naam in te vullen."
            Exit Sub
        ElseIf txtvoornaam.Text = Nothing Then
            lblErrorMessage.Text = "Gelieve een voornaam in te vullen."
            Exit Sub
        ElseIf txttelefoonnr.Text = Nothing Then
            lblErrorMessage.Text = "Gelieve een telefoonnr in te vullen."
            Exit Sub
        ElseIf boolTelefoonnr = False Then
            lblErrorMessage.Text = "Gelieve een telefoonnr in te vullen."
            Exit Sub
        ElseIf txtadres.Text = Nothing Then
            lblErrorMessage.Text = "Gelieve een adres in te vullen."
            Exit Sub

        End If



        Dim cmd As MySqlCommand = New MySqlCommand
        Dim con As MySqlConnection = New MySqlConnection


        Dim naam As String = txtnaam.Text
        Dim voornaam As String = txtvoornaam.Text
        Dim adres As String = txtadres.Text
        Dim telefoon As Integer = Convert.ToInt32(txttelefoonnr.Text)



        Dim strSql As String = "INSERT INTO klant(naam,voornaam,telefoonnr,adres) VALUES('" & naam & "','" & voornaam & "','" & telefoon & "','" & adres & "')"

        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ftcConnectionstring").ToString

        cmd.Connection = con
        cmd.CommandText = strSql

        con.Open()

        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            lblErrorMessage.Text = ex.Message
        End Try

        con.Close()

        If lblErrorMessage.Text = Nothing Then

            Server.Transfer("/leden/verkoper/klantenBeheren.aspx")
        End If

    End Sub

    Protected Sub grvKlanten_RowDataBound(sender As Object, e As GridViewRowEventArgs)

    End Sub

    Protected Sub btnNieuweKlant1_Click(sender As Object, e As EventArgs) Handles btnNieuweKlant1.Click

        panelKlant.Visible = True

        If panelKlant.Visible = True Then
            btnNieuweKlant1.Visible = False
        End If

    End Sub

    Protected Sub grvKlanten_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles grvKlanten.RowDeleting
        Dim cmd As MySqlCommand = New MySqlCommand
        Dim con As MySqlConnection = New MySqlConnection

        'gridview.DataKeys[e.RowIndex]["datakeyname"].ToString()
        Dim intKlantID As String = grvKlanten.Rows(e.RowIndex).Cells(0).Text

        Dim strSql As String = "Select klantID from bestelt where klantID =" + intKlantID

        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ftcConnectionstring").ToString

        cmd.Connection = con

        con.Open()

        cmd.CommandText = strSql

        If cmd.ExecuteScalar > 0 Then
            lblErrorMessage.Text = "Die klant heeft nog een bestelling geplaatst, hij kan niet verwijderd worden."
            e.Cancel = True
        End If

        con.Close()

        

    End Sub

   
End Class
