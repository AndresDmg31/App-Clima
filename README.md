# WeatherApp

Aplicación de clima desarrollada en Swift utilizando arquitectura VIPER. Actualmente en fase inicial (v1 base), enfocada en mostrar información del clima en tiempo real para diferentes ciudades del mundo.

## Funcionalidad actual

- Muestra en el Home el clima actual de tres ciudades principales.
- Datos mostrados: ciudad, temperatura actual, temperatura máxima y mínima, y humedad.
- Botón en el Home que permite explorar más ciudades.
- Vista adicional con una tabla de ciudades y datos básicos del clima.

## Arquitectura

- Basada en arquitectura VIPER para mantener separación clara de responsabilidades.
- Consumo de datos desde un servicio de clima utilizando **Alamofire**.
- Navegación estructurada y modular para facilitar la escalabilidad del proyecto.

## Objetivos del proyecto

- Construir una aplicación estable y mantenible desde la base.
- Aplicar correctamente los principios de arquitectura VIPER.
- Mejorar progresivamente la interfaz de usuario con un enfoque visual atractivo.
- Ampliar la app para incluir:
  - Clima de las principales ciudades del mundo.
  - Búsqueda de ciudades por nombre o ubicación actual.
  - Carruseles visuales y animaciones que representen el estado del clima.
  - Integración con Firebase y otras librerías de terceros para autenticación, analíticas y almacenamiento si se requiere.

## Tecnologías utilizadas

- Swift (nativo)
- Alamofire (consumo de servicios)
- UIKit
- Arquitectura VIPER
- [Futuro] Firebase
- [Futuro] Lottie o similares para animaciones
- [Futuro] MapKit / CoreLocation para geolocalización

## Estado del proyecto

Proyecto en desarrollo. En esta primera versión se enfoca en estructurar la base de datos, lógica y visualización mínima para luego escalar funcionalmente y visualmente.

