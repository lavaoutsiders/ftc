Public Class beheerder
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("admin") = Nothing Then
            Server.Transfer("~/Account/login.aspx")
        Else
            If Session("admin") <> 1 Then
                Server.Transfer("~/Account/login.aspx")
            End If
        End If
    End Sub

End Class