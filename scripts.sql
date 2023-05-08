create database  

USE AppLoginAndRegister

CREATE TABLE Usuarios
(
Id int identity (1000,1),
Nombres varchar (50),
Apellidos varchar(50),
FechaNacimiento varchar(50),
Usuario varchar(50),
Contrasenia varbinary(500)
)

create procedure [dbo].[SP_ValidarUsuario]
@Usuario varchar(50),
@Contrasenia varchar(50),
@Patron varchar(50)
as
begin
select*from Usuarios where Usuario=@Usuario and CONVERT(varchar(50),DECRYPTBYPASSPHRASE(@Patron, Contrasenia))=@Contrasenia
end