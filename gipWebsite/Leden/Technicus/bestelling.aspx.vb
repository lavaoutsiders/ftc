Public Class bestelling
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strEmail As String = Session("email")
        dsBestelling.FilterExpression = "emailT = '" + strEmail + "'"
    End Sub

End Class