Imports System.Data.OleDb

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("mountainspotsdb").ConnectionString)
        Dim numberofviews As String = "update restaurants set views = views+1 where restaurantid = @f1"
        Dim cmd As OleDbCommand = New OleDbCommand(numberofviews, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", Request.Params("restaurantid"))
        oleDbConn.Open()
        cmd.ExecuteNonQuery()
    End Sub
    Protected Function getstars(ByVal stars As Integer)
        Dim retval As String
        retval = ""
        For i = 1 To stars
            retval = retval + "*"
        Next
        Return retval
    End Function
End Class