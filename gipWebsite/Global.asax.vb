Imports System.Web.SessionState

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application is started
        Dim jQuery As ScriptResourceDefinition = New ScriptResourceDefinition()
        jQuery.Path = "~/scripts/jquery-1.7.2.min.js"
        jQuery.DebugPath = "~/scripts/jquery-1.7.2.js"
        jQuery.CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.7.2.min.js"
        jQuery.CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.7.2.js"
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery", jQuery)

    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires at the beginning of each request
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires upon attempting to authenticate the use
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when an error occurs
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session ends
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application ends
    End Sub

End Class