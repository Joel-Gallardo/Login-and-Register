<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRegistro.aspx.cs" Inherits="AppLoginAndRegister.frmRegistro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registrarse</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>

    
</head>
<body class="form-control bg-light">
    <div class="container small">
        <div class="row">
            <h2 class="text-center mb-5">Formulario de Registro</h2>
            <div class="col">
                 <form id="formulario_registro" class="form-check" runat="server">
                    <div>
                        <fieldset>
                            <legend>Datos Personales</legend>
                            <asp:Table runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblNombres" Text="Nombres"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="tbNombres" placeholder="ej. Joel"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblApellidos" Text="Apellidos"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="tbApellidos" placeholder="ej. Gallardo"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblFechaNacimiento" Text="Fecha de Nacimiento"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="tbFechaNacimiento" TextMode="Date"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                        <br />
                        <fieldset>
                            <legend>Datos de Login</legend>
                            <asp:Table runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblUsuario" Text="Nombre de Usuario"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="tbUsuario" placeholder="ej. Joelgm90"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>                                   
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblConfirmarContrasenia" Text="Password"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="tbConfirmarContrasenia" TextMode="Password" placeholder="Password"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label runat="server" ID="lblContrasenia" Text="Confirmar Password"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox CssClass="form-control" runat="server" TextMode="Password" ID="tbContrasenia" placeholder="Confirme Password"></asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell ColumnSpan="2">
                                        <asp:Label CssClass="alert-danger" runat="server" ID="lblError"></asp:Label>
                                        <asp:Label CssClass="alert-danger" runat="server" ID="lblErrorContrasenia"></asp:Label>
                                    </asp:TableCell>                                  
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                        <br />
                        <div>
                            <asp:Button ID="BtnRegistrar" Text="Registrar" CssClass="btn btn-dark btn-primary" runat="server" OnClick="BtnRegistrar_Click"/>
                        </div>
                        <br />
                        <div>
                            <asp:Button ID="BtnRegresar" Text="Login" CssClass="btn btn-dark btn-primary" runat="server" OnClick="BtnRegresar_Click"/>
                        </div>
                    </div>
                 </form>
            </div>
            <div  class="col">  
                <fieldset>
                    <legend>Registros Existentes</legend>
                </fieldset>
                <br />
                <div>
                    <asp:DataGrid runat="server" ID="gvUsuarios" CssClass="table"></asp:DataGrid>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
