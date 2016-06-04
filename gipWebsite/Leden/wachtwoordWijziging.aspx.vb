Imports MySql.Data.MySqlClient
Public Class wachtwoordWijziging
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' als session"niveau" is leeg dan naar loginpagina

        Dim strNiveau As String = Session("niveau")

        If strNiveau = Nothing Then
            Server.Transfer("~/Account/login.aspx")

        End If

    End Sub

    Protected Sub btnWachtwoordBevestigen_Click(sender As Object, e As EventArgs) Handles btnWachtwoordBevestigen.Click

        lblErrorMessage.Text = ""

        If txtNieuwWachtwoord.Text = Nothing Then
            lblErrorMessage.Text = "Gelieve nieuw wachtwoord in te vullen."
            Exit Sub
        End If


        Dim con As MySqlConnection = New MySqlConnection
        Dim cmd As MySqlCommand = New MySqlCommand
        Dim strEmail As String = Session("email")
        Dim nieuwWachtwoord As String = txtNieuwWachtwoord.Text
        Dim wachtwoordBevestigen As String = txtWachtwoordBevestigen.Text
        Dim oudWachtwoord As String = txtOudWachtwoord.Text
        Dim strSqlVerkoper As String = "UPDATE verkoper SET wachtwoord = SHA2('" + nieuwWachtwoord + "','Feng') where email ='" + strEmail + "'"
        Dim strSqlTechnicus As String = "UPDATE technicus SET wachtwoord = SHA2('" + nieuwWachtwoord + "','Feng') where email ='" + strEmail + "'"
        Dim strRol As String
        Dim strSqlRol As String = "SELECT niveau from technicus where email = '" + strEmail + "' AND wachtwoord = SHA2('" + oudWachtwoord + "','Feng') Union Select niveau from verkoper where email ='" + strEmail + "' and wachtwoord =SHA2('" + oudWachtwoord + "','Feng')"

        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ftcConnectionstring").ToString
        cmd.Connection = con

        'oud wachtwoord
        cmd.CommandText = strSqlRol

        con.Open()
        Try
            strRol = cmd.ExecuteScalar.ToString
        Catch ex As Exception
            lblErrorMessage.Text = ex.ToString
        End Try

        con.Close()
        ' als oud wachtwoord juist is en 2 nieuwe wachtwoorden gelijk zijn dan update
        If strRol = Nothing Then
            lblErrorMessage.Text = "Uw oud wachtwoord is verkeerd"
            Exit Sub
        End If

        If nieuwWachtwoord = wachtwoordBevestigen Then
            'als strRol = v dan gebruik strSqlVerkoper anders strSqlTechnicus
            If strRol = "v" Then
                cmd.CommandText = strSqlVerkoper
                con.Open()
                Try
                    cmd.ExecuteNonQuery()
                Catch ex As Exception
                    lblErrorMessage.Text = ex.Message
                End Try
                con.Close()
            Else : strRol = "t"
                cmd.CommandText = strSqlTechnicus
                con.Open()
                Try
                    cmd.ExecuteNonQuery()
                Catch ex As Exception
                    lblErrorMessage.Text = ex.Message
                End Try
                con.Close()
            End If
        Else
            lblErrorMessage.Text = "De wachtwoorden komen niet overeen"
            Exit Sub
        End If

        If lblErrorMessage.Text = Nothing Then
            lblErrorMessage.Text = "Succes uitgevoerd"
        End If
    End Sub
End Class