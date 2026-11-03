# Flutter Admin Demo

Aplicación de ejemplo multiplataforma construida con Flutter para explorar un
panel de administración con pantallas de inicio, clientes y facturas. Utiliza
GoRouter para la navegación, Provider para inyección de dependencias y servicios
en memoria y HTTP para los datos.

## Funcionalidades

- Pantallas de inicio y administración de clientes y facturas.
- Navegación declarativa con GoRouter y transiciones entre pantallas.
- Inyección de servicios y repositorios con Provider.
- Datos de ejemplo mantenidos en memoria durante la ejecución de la aplicación.
- Servicios HTTP basados en Dio para sincronizar las escrituras con un backend.
- Tema Material 3 y localización de interfaz en español.

## Tecnologías

| Área | Tecnología |
| --- | --- |
| Framework | Flutter |
| Lenguaje | Dart `^3.10.8` |
| Navegación | GoRouter |
| Inyección de dependencias | Provider |
| Estado reactivo | RxDart |
| HTTP | Dio |
| Pruebas | Flutter Test |

## Estructura

```text
lib/
├── data/
│   ├── memory/                 # Servicios de datos en memoria
│   ├── repository/             # Repositorios que coordinan las fuentes
│   └── webservice/             # Cliente HTTP y servicios Dio
├── domain/
│   ├── bloc/                   # Streams y lógica de presentación de datos
│   ├── entity/                 # Entidades de clientes, facturas e inicio
│   ├── dto/                    # Objetos de transferencia y filtros
│   └── event/                  # Eventos de interacción
└── presentation/
    ├── provider/               # Registro de dependencias
    ├── routes/                 # Rutas GoRouter
    ├── screens/                # Pantallas y componentes
    └── theme/                  # Tema de la aplicación
```

### Flujo de datos

Las pantallas obtienen sus repositorios desde Provider. Las consultas de los
repositorios usan los servicios en memoria. Las operaciones de escritura
actualizan primero la memoria y después envían la operación al backend por HTTP;
si la petición falla, el error se propaga y la modificación local no se revierte.
Los datos en memoria no sobreviven al cierre de la aplicación.

El backend y los timeouts HTTP se configuran en
[`lib/data/webservice/configuration/http.dart`](lib/data/webservice/configuration/http.dart).
Configura allí una dirección accesible desde el dispositivo o emulador antes de
probar la sincronización.

## Requisitos

- Flutter SDK compatible con la restricción de Dart del proyecto (`^3.10.8`).
- Backend HTTP disponible para probar las escrituras sincronizadas.

## Ejecutar

Desde la raíz del proyecto:

```bash
flutter pub get
flutter run
```

Para seleccionar un dispositivo o plataforma:

```bash
flutter devices
flutter run -d <device-id>
```

## Verificar

```bash
dart format lib/ test/
flutter analyze
flutter test
```

