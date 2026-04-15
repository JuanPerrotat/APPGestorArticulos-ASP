using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class UserNegocio
    {
        public bool Login(User usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select id, email, pass, nombre, apellido, urlImagenPerfil, admin " +
                    "from USERS where email = @email and pass = @pass");
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@pass", usuario.Pass);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["id"];
                    usuario.EsAdmin = (bool)datos.Lector["admin"];
                    if (!(datos.Lector["nombre"] is DBNull))
                        usuario.Nombre = (string)datos.Lector["nombre"];
                    if (!(datos.Lector["apellido"] is DBNull))
                        usuario.Apellido = (string)datos.Lector["apellido"];
                    if (!(datos.Lector["urlImagenPerfil"] is DBNull))
                        usuario.UrlImagenPerfil = (string)datos.Lector["urlImagenPerfil"];
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw new Exception("Error al loguear.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public int altaUser(User usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("altaUser");
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@pass", usuario.Pass);
                datos.setearParametro("@nombre", usuario.Nombre);
                return datos.ejecutarAccionScalar();
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo dar de alta al usuario.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
            
        }
        public void actualizar(User usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("actualizarUser");

                datos.setearParametro("@id", usuario.Id);
                datos.setearParametro("@email", usuario.Email);
                datos.setearParametro("@nombre", usuario.Nombre);
                datos.setearParametro("@apellido", usuario.Apellido);
                datos.setearParametro("@urlImagenPerfil", (object)usuario.UrlImagenPerfil ?? DBNull.Value);

                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo actualizar los datos del usuario.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
