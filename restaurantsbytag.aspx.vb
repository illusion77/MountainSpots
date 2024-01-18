Imports System.Data
Imports System.Data.OleDb
Imports System.Linq

Public Class restaurantsbytag
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
        Response.CacheControl = "no-cache"
        Response.AddHeader("Pragma", "no-cache")

        If Not IsPostBack Then
            BindData()
        End If
    End Sub

    Private Sub BindData(Optional sortExpression As String = "")
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("mountainspotsdb").ConnectionString
        Using connection As New OleDbConnection(connectionString)
            Dim tag As String = Request.QueryString("tag")
            Dim queryStr As String = "SELECT [restaurantname], [resort], [pic], [views], [restaurantid] FROM [restauranttagquery] WHERE ([tag] = @tag)"
            Dim command As New OleDbCommand(queryStr, connection)
            command.Parameters.AddWithValue("@tag", tag)

            Dim adapter As New OleDbDataAdapter(command)
            Dim ds As New DataSet()
            adapter.Fill(ds, "Restaurants")

            ' Implement sorting
            Dim dataView As DataView = ds.Tables("Restaurants").DefaultView
            If Not String.IsNullOrEmpty(sortExpression) Then
                dataView.Sort = sortExpression
            End If

            GridView1.DataSource = dataView
            GridView1.DataBind()
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
End Class
