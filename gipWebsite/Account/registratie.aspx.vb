
Imports MySql.Data.MySqlClient
Public Class registratie
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnNieuweGebruiker_Click(sender As Object, e As EventArgs) Handles btnNieuweGebruiker.Click

        lblErrormessage.Text = ""

        If wachtwoord.Value = wachtwoordbevestigen.Value Then

            Dim strVerkoper As String = "verkoper"
            Dim strTechnicus As String = "technicus"
            Dim con As MySqlConnection = New MySqlConnection
            Dim cmd As MySqlCommand = New MySqlCommand
            con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ftcConnectionstring").ToString()
            ' email controleren of al bestaat
            Dim intResult As Integer
            Dim strEmailControle As String = "SELECT email FROM technicus WHERE email = '" + email.Value + "' union SELECT email FROM verkoper where email = '" + email.Value + "'"
            cmd.Connection = con
            cmd.CommandText = strEmailControle
            con.Open()
            If cmd.ExecuteScalar = Nothing Then
                intResult = 0
            Else
                intResult = 1
            End If


            con.Close()

            If intResult > 0 Then
                lblErrormessage.Text = "Dit e-mailadres is al in gebruik."
                Exit Sub
            End If



            Dim intAdmin As Integer

            If ckbBeheerder.Checked Then
                intAdmin = 1
            Else
                intAdmin = 0
            End If


            ' als rol.value = verkoper voeg de gevens naar verkoper

            If rol.Value = strVerkoper Then
                Dim strSQL As String = "INSERT INTO verkoper (naam,voornaam,email,wachtwoord,admin) VALUES('" + naam.Value + "','" + voornaam.Value + "','" + email.Value + "',SHA2('" + wachtwoord.Value + "','Feng'),'" + intAdmin.ToString + "');"

                cmd.Connection = con
                cmd.CommandText = strSQL

                con.Open()

                Try
                    cmd.ExecuteNonQuery()
                Catch ex As Exception
                    lblErrormessage.Text = ex.Message
                End Try

                con.Close()

            ElseIf rol.Value = strTechnicus Then

                Dim strSQL As String = "INSERT INTO technicus (naam,voornaam,email,wachtwoord,admin) VALUES('" + naam.Value + "','" + voornaam.Value + "','" + email.Value + "','" + "',SHA2('" + wachtwoord.Value + "','Feng'),'" + intAdmin.ToString + "');"

                cmd.Connection = con
                cmd.CommandText = strSQL

                con.Open()

                Try
                    cmd.ExecuteNonQuery()
                Catch ex As Exception
                    lblErrormessage.Text = ex.Message
                End Try

                con.Close()

            Else

                lblErrormessage.Text = "Is hij een technicus of verkoper?"

            End If
        Else
            lblErrormessage.Text = "De wachtwoord komt niet overeen."



        End If

        If lblErrormessage.Text = Nothing Then
            lblErrormessage.Text = "Succes uitgevoerd"
        End If

    End Sub
End Class