create procedure StoredListar as
Select A.Nombre, a.Descripcion as Descripción, M.Descripcion as Marca, C.Descripcion as Categoría, A.Precio, A.ImagenUrl from 
ARTICULOS A, MARCAS M, CATEGORIAS C 
where A.IdCategoria = M.Id
and a.IdMarca = C.Id
