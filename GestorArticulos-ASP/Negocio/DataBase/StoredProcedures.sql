Select A.Id, A.Codigo, A.Nombre, A.Descripcion, A.ImagenUrl, A.IdMarca, A.IdCategoria, C.Descripcion as Categoria, M.Descripcion as Marca, A.Precio 
from ARTICULOS A, CATEGORIAS C, MARCAS M 
where A.IdCategoria = C.Id and A.IdMarca = M.Id