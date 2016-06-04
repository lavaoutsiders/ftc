Imports MySql.Data.MySqlClient
Public Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub wcAanmelden_Authenticate(sender As Object, e As AuthenticateEventArgs) Handles wcAanmelden.Authenticate
        Dim con As MySqlConnection = New MySqlConnection
        Dim cmd As MySqlCommand = New MySqlCommand

        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ftcConnectionstring").ToString

        'select niveau from verkoper where email = "lin.feng55@hotmail.com" and wachtwoord = "123456"
        ' union
        'Select  niveau from technicus where email = "lin.feng55@hotmail.com" And wachtwoord = "123456"
        Dim strNiveau As String
        Dim intAdmin As Integer

        Dim strSqlAdmin As String = "Select admin From verkoper Where ( email = @email And wachtwoord = SHA2(@wachtwoord,'Feng')) Union Select admin From technicus where ( email=@email And wachtwoord = SHA2(@wachtwoord,'Feng'))"

        Dim strSql As String = "Select niveau From verkoper Where ( email= @email And wachtwoord = SHA2(@wachtwoord,'Feng')) Union Select niveau From technicus where ( email= @email And wachtwoord = SHA2(@wachtwoord,'Feng'))"

        'cmd
        cmd.Connection = con
        cmd.CommandText = strSqlAdmin
        cmd.Parameters.AddWithValue("@email", wcAanmelden.UserName)
        cmd.Parameters.AddWithValue("@wachtwoord", wcAanmelden.Password)
        'open de verbinding

        'execute
        con.Open()
        Try
            Session("admin") = cmd.ExecuteScalar.ToString
        Catch ex As Exception
            wcAanmelden.FailureText = ex.ToString
        End Try

        ' If intAdmin = Nothing Then
        'intAdmin = Nothing
        'Else
        'intAdmin = cmd.ExecuteScalar.ToString
        'Session("admin") = intAdmin
        'End If
        con.Close()

        cmd.CommandText = strSql

        con.Open()

            Try
                strNiveau = cmd.ExecuteScalar.ToString
            Catch ex As Exception
                wcAanmelden.FailureText = ex.ToString
        End Try

            Session("niveau") = strNiveau
            con.Close()

            If strNiveau = Nothing Then
                wcAanmelden.FailureText = "Foutive aanmelding. Probeer opnieuw!"
                Exit Sub
            End If


        Session("email") = wcAanmelden.UserName

        FormsAuthentication.RedirectFromLoginPage(wcAanmelden.UserName, False)

        Response.Redirect("~/home.aspx")

    End Sub
End Class