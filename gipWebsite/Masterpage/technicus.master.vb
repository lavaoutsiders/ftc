Public Class technicus
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'als session"niveau" = null en session"admin" =null naar login
        'als  is niet tech ook niet admin dan naar login
        'als session"niveau" is niet "t" en session "admin" = null dan naar login
        'als session"niveau" is niet "t" en session "admin" is niet 1  dan naar login

        If Session("niveau") = Nothing And Session("admin") = Nothing Then
            Server.Transfer("~/Account/login.aspx")
        ElseIf Session("niveau") <> "t" And Session("admin") <> 1 Then
            Server.Transfer("~/Account/login.aspx")
        ElseIf Session("niveau") <> "t" And Session("admin") = Nothing Then
            Server.Transfer("~/Account/login.aspx")
        ElseIf Session("niveau") <> "t" And Session("admin") Then

        End If
    End Sub

End Class