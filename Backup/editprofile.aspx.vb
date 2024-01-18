Imports System.Data.OleDb
Public Class editprofile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("mountainspotsdb").ConnectionString)
            Dim SqlString As String = "select * from members where skiername=@f1"
            Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@f1", User.Identity.Name)
            oleDbConn.Open()
            Dim dr As OleDbDataReader = cmd.ExecuteReader()
            If dr.HasRows() Then
                dr.Read()
                If Not IsDBNull(dr("firstname")) Then TextBox1.Text = dr("firstname")
                If Not IsDBNull(dr("lastname")) Then TextBox2.Text = dr("lastname")
                If Not IsDBNull(dr("homelocation")) Then TextBox3.Text = dr("homelocation")
                If Not IsDBNull(dr("ability")) Then TextBox4.Text = dr("ability")

            End If
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim newfilename As String
        Dim SqlString As String
        If FileUpload1.HasFile Then
            Dim myguid = Guid.NewGuid()
            newfilename = myguid.ToString() & ".jpg"
            Dim piclocationonserver = Request.MapPath("photos") & "/" & newfilename
            FileUpload1.SaveAs(piclocationonserver)
        End If

        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("mountainspotsdb").ConnectionString)
        If FileUpload1.HasFile Then
            SqlString = "update members set firstname = @f1, lastname = @f2, homelocation = @f3, ability = @f4, picture = @f5 where skiername = @f6"
        Else
            SqlString = "update members set firstname = @f1, lastname = @f2, homelocation = @f3, ability = @f4 where skiername = @f6"
        End If
        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", TextBox1.Text)
        cmd.Parameters.AddWithValue("@f2", TextBox2.Text)
        cmd.Parameters.AddWithValue("@f3", TextBox3.Text)
        cmd.Parameters.AddWithValue("@f4", TextBox4.Text)
        If FileUpload1.HasFile Then
            cmd.Parameters.AddWithValue("@f5", "/photos/" & newfilename)
        End If
        cmd.Parameters.AddWithValue("@f6", User.Identity.Name)
        oleDbConn.Open()
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        oleDbConn.Close()
        oleDbConn.Dispose()
        Response.Redirect("profile.aspx?skiername=" & User.Identity.Name)
    End Sub
End Class