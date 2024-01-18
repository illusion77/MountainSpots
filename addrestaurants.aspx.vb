Imports System.Data.OleDb

Public Class addrestaurants
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim myGUID = Guid.NewGuid()
        Dim newfilename As String = myGUID.ToString() & ".jpg"

        Dim piclocationonserver = Request.MapPath("photos") & "/" & newfilename
        FileUpload1.SaveAs(piclocationonserver)

        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("mountainspotsdb").ConnectionString)
        Dim SqlString As String = "Insert into restaurants(restaurantname,resort,pic) Values (@f1,@f2,@f3)"
        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", TextBox1.Text)
        cmd.Parameters.AddWithValue("@f2", DropDownList1.SelectedValue)
        cmd.Parameters.AddWithValue("@f3", "photos/" & FileUpload1.FileName)
        oleDbConn.Open()
        cmd.ExecuteNonQuery()
        Response.Redirect("confirmation.aspx")
    End Sub
End Class