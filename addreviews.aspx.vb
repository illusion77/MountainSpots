Imports System.Data.OleDb

Public Class addreviews
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("mountainspotsdb").ConnectionString)
        Dim SqlString As String = "Insert into reviews(restaurantid,memberid,access,typeofrestaurant,costspagbol,costcoffee,costbeer,seating,hooks,bookingnecessary,toilets,stars,fire,review) Values (@f1,@f2,@f3,@f4,@f5,@f6,@f7,@f8,@f9,@f10,@f11,@f12,@f13,@f14)"
        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", DropDownList1.SelectedValue)
        cmd.Parameters.AddWithValue("@f2", User.Identity.Name)
        cmd.Parameters.AddWithValue("@f3", DropDownList3.SelectedValue)
        cmd.Parameters.AddWithValue("@f4", DropDownList4.SelectedValue)
        cmd.Parameters.AddWithValue("@f5", DropDownList5.SelectedValue)
        cmd.Parameters.AddWithValue("@f6", DropDownList6.SelectedValue)
        cmd.Parameters.AddWithValue("@f7", DropDownList7.SelectedValue)
        cmd.Parameters.AddWithValue("@f8", DropDownList8.SelectedValue)
        cmd.Parameters.AddWithValue("@f9", DropDownList9.SelectedValue)
        cmd.Parameters.AddWithValue("@f10", DropDownList10.SelectedValue)
        cmd.Parameters.AddWithValue("@f11", DropDownList11.SelectedValue)
        If RadioButtonList1.SelectedValue <> "" Then
            cmd.Parameters.AddWithValue("@f12", RadioButtonList1.SelectedValue)
        Else
            cmd.Parameters.AddWithValue("@f12", 1)
        End If
        cmd.Parameters.AddWithValue("@f13", RadioButtonList2.SelectedValue)
        cmd.Parameters.AddWithValue("@f14", TextBox3.Text)
        oleDbConn.Open()
        cmd.ExecuteNonQuery()
        'Dim oleDbConn2 As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("mountainspotsdb").ConnectionString)
        Dim SqlString2 As String = "Insert into tagjoin(restaurantid,tagid) Values(@f20,@f21)"

        For Each cb As ListItem In CheckBoxList1.Items
            If cb.Selected Then
                'adding the jointag
                Dim cmd2 As OleDbCommand = New OleDbCommand(SqlString2, oleDbConn)
                cmd2.CommandType = CommandType.Text
                cmd2.Parameters.AddWithValue("@f20", DropDownList1.SelectedValue)
                cmd2.Parameters.AddWithValue("@f21", cb.Value)
                cmd2.ExecuteNonQuery()
            End If
        Next

        If TextBox1.Text <> "" Then
            Dim newtags = TextBox1.Text.Split(",")
            'first add new tags to tag table
            For Each newtag In newtags
                Dim newtagsql As String = "insert into tags(tag) values(@f30)"
                Dim cmd3 As OleDbCommand = New OleDbCommand(newtagsql, oleDbConn)
                cmd3.CommandType = CommandType.Text
                cmd3.Parameters.AddWithValue("@f30", newtag)
                cmd3.ExecuteNonQuery()
                ' get the id of the new tag
                Dim getlastidcmd As OleDbCommand = New OleDbCommand("select top 1 ID from tags order by ID DESC", oleDbConn)
                Dim dr = getlastidcmd.ExecuteReader()
                dr.Read()
                Dim lastid = dr.GetValue(0)
                'add to join table
                Dim newcmd As OleDbCommand = New OleDbCommand(SqlString2, oleDbConn)
                newcmd.CommandType = CommandType.Text
                newcmd.Parameters.AddWithValue("@f20", DropDownList1.SelectedValue)
                newcmd.Parameters.AddWithValue("@f21", lastid)
                newcmd.ExecuteNonQuery()

            Next
        End If
        Response.Redirect("confirmation.aspx")
    End Sub
End Class