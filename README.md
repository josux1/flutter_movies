# Flutter Movies
El proyecto de Flutter Movies consta de una app que permite al usuario tener acceso a todas las principales peliculas consumiendo el servicio TMDB, de manera online y offline sin problema.

# Uso
- La primera ves de usar el app, asegúrese de estar conectado a una red. Esto descargará las películas para vista en modo offline. 


# Funciones principales
- Consumo de api tmdb.
- Persistencia de peliculas en almacenamiento local con Isar.
- Manejo de imagenes en caché.
- Posibilidad de eliminar la memoria caché.
- Posibilidad de eliminar las peliculas persistidas.
- Manejo de conexión a internet.
- Persistencia tema claro o tema oscuro con shared preferences.


### Arquitectura
Este proyecto está hecho con la arquitectura MVVC (Modelo Vista - Vista Controlador Con Domain Driven Design) para Flutter.

- Repository
- Service
- Provider
- Controller
- Screen

| Capa | Función |
| ------ | ------ |
| Repository | Se encarga de géstionar todas las comunicaciones por peticiones http con los servicios que se le conecten. |
| Service | Se encarga de géstionar toda la lógica de negocio del modulo. Ej. Si es módulo de Pérfil. El service se encarga de pasarle toda la informacion que viene del Repository, como se requiera, al controller.
| Provider | Se encarga de dar la referencia al controller. Provee la instancia del Service al controller.|
| Controller | Se encarga de administrar toda la logica visual del screen. Le pasa toda la informacion que viene del service al screen. Ej. Muestra cuadros de Diálogo, Modales etc. |
| Screen | Se encarga de mostrar toda la pantalla del módulo.  |

### Info Versionamiento
- Instucción para cambiar ícono
flutter pub run flutter_launcher_icons


 Versón de Flutter
• Flutter 3.16.0
• Dart 3.2.0 
• App Version 1.0.0