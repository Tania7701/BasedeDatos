# 📘 Diccionario de Datos – Vehiculos
**Tabla Cliente**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `numCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | > -                                        | -                                | Identificador del cliente               |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     | -             | -                                | 
Nombre completo del cliente             |
|  `Apellido1`      | NVARCHAR    | 20    |  ❌ |  ❌  |  ❌  | ❌      | -                                        |
|  `Apellido2`      | NVARCHAR    | 20    |  ❌ |  ❌  |  ❌  | ❌      | -                                        |
| `Edad`          | INT          | -      | ❌  | ❌  | ❌   | ❌     | CHECK (Edad >= 18 AND Edad <= 120)         | -                                | Edad del cliente                        |
| `Correo`        | VARCHAR      | 150    | ❌  | ❌  | ❌   | ✅     | Formato de correo válido                   | -                                | Correo electrónico                      |
| `IdCiudad`      | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                        | Ciudades(IdCiudad)               | Ciudad a la que pertenece el cliente    |
