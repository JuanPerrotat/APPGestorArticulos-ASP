--Consulta a la BD para traer los articulos con su marca y categoria

Select A.Id, A.Codigo, A.Nombre, A.Descripcion, A.ImagenUrl, A.IdMarca, A.IdCategoria, C.Descripcion as Categoria, M.Descripcion as Marca, A.Precio 
from ARTICULOS A, CATEGORIAS C, MARCAS M 
where A.IdCategoria = C.Id and A.IdMarca = M.Id
GO

--Creación del SP para consultar a la DB

create procedure ListarStored as
select A.Id, A.Codigo, A.Nombre, A.Descripcion, A.ImagenUrl, A.IdMarca, A.IdCategoria, C.Descripcion as Categoria, M.Descripcion as Marca, A.Precio 
from ARTICULOS A, CATEGORIAS C, MARCAS M 
where A.IdCategoria = C.Id and A.IdMarca = M.Id
GO


--Creación de SP para Alta de nuevo artículo
create procedure storedAltaArticulos
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar(150), 
@idMarca int,
@idCategoria int,
@imagenUrl varchar(1000),
@precio money
as
insert into ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, ImagenUrl, Precio) values (@codigo, @nombre, @descripcion, @idMarca, @idCategoria, @imagenUrl, @precio)
GO

--Creacion del SP para modificar un artículo
create procedure storedModificarArticulo
@id int,
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar(150),
@idCategoria int,
@idMarca int, 
@imagenUrl varchar(1000),
@precio money
as
UPDATE ARTICULOS set
Codigo = @codigo, Nombre = @nombre, Descripcion = @descripcion, IdCategoria = @idCategoria, 
IdMarca = @idMarca, ImagenUrl = @imagenUrl, Precio = @precio
where Id = @id
GO

--Creacion del SP para alta de User
create procedure altaUser
@email varchar(50),
@pass varchar(50)
as
insert into USERS (email, pass, admin) output inserted.Id values (@email, @pass, 0)
GO
