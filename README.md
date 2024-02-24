# Prueba Klikin

## Arquitectura ⚒️ 

* **Patrón de arquitectura**:
	
	Utilicé el patrón de arquitectura MVVM, porque creo que tiene el equilibrio perfecto entre orden y funcionalidad para un proyecto de pequeño-mediano tamaño

* **Llamadas**:
	
	He utilizado async await para implementar las llamadas a la API, prefiero gestionar todas las llamadas de red por mí mismo para saber exactamente lo que hago y cómo hago todo.

* **UI**:
	
	He utilizado XIBs para diseñar la interfaz de usuario, elijo esa forma porque creo que es la mejor manera de gestionar la interfaz de usuario en una aplicación iOS (con UIKit) y también es la forma más popular de hacerlo.

## Librerías 📚

He utilizado el gestor de dependencias nativo de Xcode (Swift Package Manager) para el proyecto, he elegido este por encima de CocoaPods por facilidad de uso. 

* CustomUIKitItems, Esta librería me aporta los elementos más importantes de UIKit con más y mejores funciones, es de creación propia, está hecha al completo por mí, podéis encontrar todos los detalles de la misma en mi GitHub, además está disponible para su uso con SPM y CocoaPods.
