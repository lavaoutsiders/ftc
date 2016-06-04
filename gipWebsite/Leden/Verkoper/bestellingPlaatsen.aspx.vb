Imports MySql.Data.MySqlClient
Public Class bestellingPlaatsen
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String = Session("email")
        Dim intAdmin As Integer = Session("admin")

        If intAdmin = 0 Then
            dsVerkoper.FilterExpression = "email='" + email + "'"
        End If

    End Sub

    Protected Sub btnNieuweBestelling_Click(sender As Object, e As EventArgs) Handles btnNieuweBestelling.Click

        Dim boolAantal As Boolean = IsNumeric(txtAantal.Text)

        If txtAantal.Text = Nothing Then
            lblErrorMessage.Text = "Gelieve het aantal in te voeren."
            Exit Sub
        ElseIf boolAantal = False Then
            lblErrorMessage.Text = "Gelieve het aantal in te voeren."
            Exit Sub
        ElseIf txtAantal.Text <= 0 Then
            lblErrorMessage.Text = "Gelieve het aantal in te voeren."
            Exit Sub
        ElseIf afleveringsdatum.SelectedDate = "0001-01-01" Or afleveringsdatum.SelectedDate < Date.Now.ToShortDateString Then
            lblErrorMessage.Text = "Gelieve een datum te kiezen."
            Exit Sub
        Else
            lblErrorMessage.Text = ""
        End If

        Dim con As MySqlConnection = New MySqlConnection
        Dim cmd As MySqlCommand = New MySqlCommand

        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("ftcConnectionstring").ToString
        cmd.Connection = con

        Dim strKlantID As String = dpdKlanten.Text
        Dim strComputerNr As String = dpdModel.SelectedValue.ToString
        Dim strAantal As String = txtAantal.Text
        Dim strExtraInfo As String = txtExtraInfo.Text
        Dim strEmailV As String = dpdVerkoper.SelectedValue.ToString
        Dim strEmailT As String = dpdTechnicus.SelectedValue.ToString
        Dim dteAfleveringsdatum As Date = Convert.ToDateTime(afleveringsdatum.SelectedDate)
        Dim strAflevering As String = dteAfleveringsdatum.Year.ToString + "-" + dteAfleveringsdatum.Month.ToString + "-" + dteAfleveringsdatum.Day.ToString


        '  Dim provider As Globalization.CultureInfo = Globalization.CultureInfo.InvariantCulture

        'probleem met tijd format
        '  strAflevering = Date.ParseExact(strAflevering, "yyyyMMdd", provider)
        Dim strSql As String = "INSERT INTO bestelt (klantID,computerNr,aantal,extraInfo,emailV,emailT,afleveringsdatum) VALUES('" + strKlantID + "','" + strComputerNr + "','" + strAantal + "','" + strExtraInfo + "','" + strEmailV + "','" + strEmailT + "','" + strAflevering + "')"

        cmd.CommandText = strSql

        con.Open()
        Try
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            lblErrorMessage.Text = ex.Message
        End Try
        con.Close()

        If lblErrorMessage.Text = Nothing Then
            Server.Transfer("~/Leden/Verkoper/BestellingPlaatsen.aspx")
        End If

    End Sub

    Protected Sub dpwVerkoper_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpdVerkoper.SelectedIndexChanged

    End Sub

    Protected Sub grvBestelling_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grvBestelling.SelectedIndexChanged

    End Sub
End Class