[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/GWaJXfvb)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=18060077)
# Repositorio para la clase de Taller de BD


# Levantar un sql-server para pruebas

Para probar nuestro modelo necesitamos una instancia de SQL Server. Puede ser en On Premise, Azure o AWS. Usaremos un contenedor de Docker para las pruebas.
 
Abrir la terminal y ejecutar el siguiente comando
```
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Gestion8.0" -e "MSSQL_PID=Developer" --name sqlserver -p 1433:1433 -d mcr.microsoft.com/mssql/server:latest
```

Estamos usando Docker para crear un servidor de SQL Server con la edición de Desarrollador desde una imagen de Microsoft. Usamos SQL Authentication, el usuario ```sa``` y ```Gestion8.0``` como password. 

Este servidor no es persistente así que la base de datos que se cree (y los datos en ella) se perderán al detener el contenedor.

En el archivo ```devcontainer``` ya están especificadas las extensiones de VSCode necesarias (mssql y mermaid)



