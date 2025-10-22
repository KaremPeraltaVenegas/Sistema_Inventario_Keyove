<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FrmWebCategoria.aspx.cs" Inherits="SistemaInventarioKeyove.FrmWebCategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoBody" runat="server">
    <form id="form1" runat="server" class="container mt-4">

        <h2 class="mb-4 text-center">Lista de Categorías</h2>
        <asp:GridView ID="GridViewCategorias" runat="server" CssClass="table table-bordered table-hover text-center"
                      AutoGenerateColumns="False" DataKeyNames="Id">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
            </Columns>
        </asp:GridView>

        
        <div class="text-center mt-3">
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar Categoría"
                        CssClass="btn btn-primary me-2"
                        OnClientClick="abrirModalAgregar(); return false;" />
        </div>

        
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
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>

        
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
                            <asp:TextBox ID="txtEditarDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-warning" OnClick="btnActualizar_Click" />
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>

       
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

    </form>
</asp:Content>

