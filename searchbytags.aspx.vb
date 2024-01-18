Imports System.Data
Imports System.Data.OleDb
Imports System.Linq

Public Class searchbytags
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindData()
        End If
    End Sub

    Private Sub BindData()
        ' Replace with your OleDb connection string
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("mountainspotsdb").ConnectionString
        Using connection As New OleDbConnection(connectionString)
            Dim adapter As New OleDbDataAdapter("SELECT [tag] FROM [tags]", connection)
            Dim ds As New DataSet()
            adapter.Fill(ds, "Tags")

            ' Using LINQ to query the DataSet
            Dim query = From tag In ds.Tables("Tags").AsEnumerable()
                        Select tag

            ' Binding the query result to the GridView
            GridView1.DataSource = query.AsDataView()
            GridView1.DataBind()
        End Using
    End Sub
End Class
