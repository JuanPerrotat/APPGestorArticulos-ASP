# 📦 Stocker – Sistema de Gestión de Artículos

**Stocker** es una aplicación web desarrollada con **ASP.NET WebForms** y **C#**, orientada a la gestión de artículos mediante operaciones completas de tipo **CRUD (ABM)**. El proyecto implementa una arquitectura en capas y se conecta a una base de datos SQL, permitiendo administrar información de manera estructurada, validada y persistente.

---

## 🚀 Tecnologías utilizadas

* **Backend:** C# (.NET – ASP.NET WebForms)
* **Frontend:** HTML, CSS, JavaScript, Bootstrap
* **Base de datos:** SQL
* **Motor de base de datos:** SQL Server (SQL Server Management Studio 2026)

---

## 🧠 Arquitectura

La aplicación está construida bajo un modelo de **arquitectura en capas**, lo que permite una mejor organización del código, mantenimiento y escalabilidad:

* **Capa de Presentación:** Interfaces web (ASPX), interacción con el usuario
* **Capa de Negocio:** Lógica de negocio, validaciones y reglas
* **Capa de Dominio:** Modelos de datos
* **Acceso a Datos:** Comunicación con la base de datos mediante SQL

---

## ⚙️ Funcionalidades principales

* ✔️ Alta de artículos
* ✔️ Modificación de artículos
* ✔️ Eliminación de artículos
* ✔️ Visualización de listado y detalle
* ✔️ Sistema de login con usuario (nombre, apellido e imagen)
* ✔️ Envío de mails desde formulario de contacto
* ✔️ Respuesta personalizada vía correo electrónico
* ✔️ Validaciones de datos en frontend y backend
* ✔️ Manejo de errores controlado

---

## 🔐 Seguridad y validaciones

Se implementaron validaciones tanto del lado del cliente como del servidor para asegurar la integridad de los datos. Además, se incorporó manejo de excepciones para evitar fallos inesperados en la aplicación.

---

## 📬 Sistema de contacto

La aplicación cuenta con un formulario que permite al usuario enviar consultas vía email. El sistema procesa la solicitud y genera una **respuesta personalizada** al remitente.

---

## 🖥️ Interfaz

Se utilizó **Bootstrap** para lograr una interfaz responsive, adaptable a distintos dispositivos, junto con HTML, CSS y JavaScript para mejorar la experiencia de usuario.

---

## 📂 Estructura del proyecto

```
Stocker/
│
├── Dominio/
├── Negocio/
├── Presentacion/
├── Datos/
├── Scripts SQL/
└── README.md
```

---

## 🛠️ Cómo ejecutar el proyecto

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/tu-usuario/stocker.git
   ```

2. Abrir la solución en Visual Studio

3. Configurar la cadena de conexión a la base de datos en `Web.config`

4. Ejecutar los scripts SQL para crear la base de datos

5. Ejecutar el proyecto

---

## 📌 Estado del proyecto

✔️ Funcional y completo
🔧 Posibles mejoras futuras:

* Implementación de API REST
* Migración a .NET moderno (MVC o .NET Core)
* Mejoras en seguridad (hash de contraseñas, autenticación más robusta)
* Paginación y filtros avanzados

---

## 👨‍💻 Autor

Desarrollado por Juan como parte de su proceso de formación en desarrollo web y backend con .NET.

---

## 📄 Licencia

Este proyecto es de uso educativo y puede ser reutilizado con fines de aprendizaje.
