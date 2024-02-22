//
//  LocationManager.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 21/2/24.
//

import CoreLocation

class LocationManager: NSObject {
  static let kDefaultLocation = CLLocation(latitude: 40.4168577, longitude: -3.7043091) /// Puerta del Sol, Madrid

  static var shared = LocationManager()

  public var lastUserLocation: CLLocation!

  private var locationManager: CLLocationManager = CLLocationManager()

  override private init() {
    super.init()

    if let location = UserDefaults.standard.lastLocation {
      lastUserLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
    } else {
      lastUserLocation = LocationManager.kDefaultLocation
    }

    locationManager.delegate = self

    /// Start updating location
    locationManager.startUpdatingLocation()
  }

  public func requestLocationPermission() {
    let status = locationManager.authorizationStatus
    switch status {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied:
      CustomNavigationController.instance.showAlertView(title: "Permiso de ubicación", message: "Si quieres que las tiendas se ordenen por proximidad, ve a Ajustes y cambia los permisos de ubicación de la app", buttonText: "Vale")
    case .authorizedWhenInUse:
      locationManager.requestAlwaysAuthorization()
      print("authorized")
    case .authorizedAlways:
      print("authorized")
    @unknown default: break
    }
  }
}

// MARK: - CLLocationManagerDelegate

extension LocationManager: CLLocationManagerDelegate {
  public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    self.requestLocationPermission()
  }

  func locationManager(_ manager: CLLocationManager,didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }

    lastUserLocation = location

    UserDefaults.standard.lastLocation = Location(location: lastUserLocation)
  }
}
