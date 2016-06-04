Public Class Site1
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("niveau") = "t" Then
            menuBeheerder.Visible = False
            menuTechnicus.Visible = True
            menuVerkoper.Visible = False
            menuOnbekend.Visible = False
        ElseIf Session("niveau") = "v" Then
            menuBeheerder.Visible = False
            menuTechnicus.Visible = False
            menuVerkoper.Visible = True
            menuOnbekend.Visible = False

        Else
            menuBeheerder.Visible = False
            menuTechnicus.Visible = False
            menuVerkoper.Visible = False
            menuOnbekend.Visible = True
        End If
        If Session("admin") = 1 Then
            menuBeheerder.Visible = True
            menuTechnicus.Visible = False
            menuVerkoper.Visible = False
            menuOnbekend.Visible = False
        End If
    End Sub

    Protected Sub Loginstatus1_LoggingOut(sender As Object, e As LoginCancelEventArgs) Handles Loginstatus1.LoggingOut
        Session("admin") = Nothing
        Session("niveau") = Nothing
        menuBeheerder.Visible = False
        menuTechnicus.Visible = False
        menuVerkoper.Visible = False
        menuOnbekend.Visible = True
    End Sub
End Class