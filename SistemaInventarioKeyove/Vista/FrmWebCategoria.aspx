ASPX.CS

using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventarioKeyove
{
    public partial class FrmWebCategoria : System.Web.UI.Page
    {
        string conexionString = "Data Source=DESKTOP-NC03344\\MSSQLSERVER0;Initial Catalog=ProductosBD;Integrated Security=True";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarCategorias();
        }

        private void CargarCategorias()
        {
            using (SqlConnection conexion = new SqlConnection(conexionString))
            {
                string query = "SELECT Id, Nombre, Descripcion FROM Categorias";
                SqlDataAdapter da = new SqlDataAdapter(query, conexion);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewCategorias.DataSource = dt;
                GridViewCategorias.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = new SqlConnection(conexionString))
            {
                string query = "INSERT INTO Categorias (Nombre, Descripcion) VALUES (@Nombre, @Descripcion)";
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                cmd.Parameters.AddWithValue("@Descripcion", txtDescripcion.Text);

                conexion.Open();
                cmd.ExecuteNonQuery();
                conexion.Close();
            }

            CargarCategorias();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = new SqlConnection(conexionString))
            {
                string query = "UPDATE Categorias SET Nombre = @Nombre, Descripcion = @Descripcion WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@Id", hfIdCategoria.Value);
                cmd.Parameters.AddWithValue("@Nombre", txtEditarNombre.Text);
                cmd.Parameters.AddWithValue("@Descripcion", txtEditarDescripcion.Text);

                conexion.Open();
                cmd.ExecuteNonQuery();
                conexion.Close();
            }

            CargarCategorias();
        }
    }
}


ASPX

%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FrmWebCategoria.aspx.cs" Inherits="SistemaInventarioKeyove.FrmWebCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHeader" runat="server">
    <!-- Aquí puedes poner estilos o scripts específicos -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoBody" runat="server">

    <div class="container mt-4">
        <h2 class="text-center mb-4">Gestión de Categorías</h2>

        <!-- Tabla -->
        <asp:GridView ID="GridViewCategorias" runat="server"
            CssClass="table table-bordered table-hover text-center"
            AutoGenerateColumns="False" DataKeyNames="Id">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
            </Columns>
        </asp:GridView>

        <!-- Botón agregar -->
        <div class="text-center mt-3">
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar Categoría"
                CssClass="btn btn-primary me-2"
                OnClientClick="abrirModalAgregar(); return false;" />
        </div>

        <!-- Modal Agregar -->
        <div class="modal fade" id="modalAgregar" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Agregar Nueva Categoría</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="txtNombre" class="form-label">Nombre:</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtDescripcion" class="form-label">Descripción:</label>
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar"
                            CssClass="btn btn-success" OnClick="btnGuardar_Click" />
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Editar -->
        <div class="modal fade" id="modalEditar" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Editar Categoría</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        <asp:HiddenField ID="hfIdCategoria" runat="server" />
                        <div class="mb-3">
                            <label for="txtEditarNombre" class="form-label">Nombre:</label>
                            <asp:TextBox ID="txtEditarNombre" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtEditarDescripcion" class="form-label">Descripción:</label>
                            <asp:TextBox ID="txtEditarDescripcion" runat="server"
                                CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnActualizar" runat="server" Text="Actualizar"
                            CssClass="btn btn-warning" OnClick="btnActualizar_Click" />
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- JS -->
        <script>
            function abrirModalAgregar() {
                var modal = new bootstrap.Modal(document.getElementById('modalAgregar'));
                modal.show();
            }

            function abrirModalEditar() {
                var modal = new bootstrap.Modal(document.getElementById('modalEditar'));
                modal.show();
            }
        </script>
    </div>

</asp:Content>

