Imports System.Data
Imports System.Data.OleDb

Public Class WebForm1
    Inherits System.Web.UI.Page

    Private Property GridViewSortDirection As String
        Get
            Return If(ViewState("SortDirection"), "ASC")
        End Get
        Set(value As String)
            ViewState("SortDirection") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            UpdateViews()
            BindData()
        End If
    End Sub

    Private Sub UpdateViews()
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("mountainspotsdb").ConnectionString
        Using connection As New OleDbConnection(connectionString)
            Dim updateQuery As String = "UPDATE restaurants SET views = views + 1 WHERE restaurantid = ?"
            Using command As New OleDbCommand(updateQuery, connection)
                command.Parameters.AddWithValue("?", Request.QueryString("restaurantid"))
                connection.Open()
                command.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    Private Sub BindData(Optional sortExpression As String = "")
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("mountainspotsdb").ConnectionString
        Using connection As New OleDbConnection(connectionString)
            Dim selectQuery As String = "SELECT * FROM [reviews] WHERE ([restaurantid] = ?)"
            Using command As New OleDbCommand(selectQuery, connection)
                command.Parameters.AddWithValue("?", Request.QueryString("restaurantid"))

                Dim adapter As New OleDbDataAdapter(command)
                Dim ds As New DataSet()
                adapter.Fill(ds, "Reviews")

                ' Implement sorting
                Dim dataView As DataView = ds.Tables("Reviews").DefaultView
                If Not String.IsNullOrEmpty(sortExpression) Then
                    dataView.Sort = sortExpression
                End If

                GridView1.DataSource = dataView
                GridView1.DataBind()
            End Using
        End Using
    End Sub

    Protected Sub GridView1_Sorting(sender As Object, e As GridViewSortEventArgs) Handles GridView1.Sorting
        Dim sortDirection As String = GetSortDirection(e.SortExpression)
        BindData(e.SortExpression & " " & sortDirection)
    End Sub

    Private Function GetSortDirection(sortExpression As String) As String
        If ViewState("SortExpression") IsNot Nothing AndAlso ViewState("SortExpression").ToString() = sortExpression Then
            If GridViewSortDirection = "ASC" Then
                GridViewSortDirection = "DESC"
            Else
                GridViewSortDirection = "ASC"
            End If
        Else
            GridViewSortDirection = "ASC"
        End If
        ViewState("SortExpression") = sortExpression
        Return GridViewSortDirection
    End Function

    Protected Function getstars(ByVal stars As Integer) As String
        Return New String("*"c, stars)
    End Function
End Class
