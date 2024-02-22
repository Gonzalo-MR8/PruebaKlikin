//
//  Location.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 21/2/24.
//

import CoreLocation

struct Location: Codable {
  let latitude: CLLocationDegrees
  let longitude: CLLocationDegrees

  init(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
      self.latitude = latitude
      self.longitude = longitude
  }

  init(location: CLLocation) {
      self.latitude = location.coordinate.latitude
      self.longitude = location.coordinate.longitude
  }
}

extension CLLocation {
  convenience init(location: Location) {
    self.init(latitude: location.latitude, longitude: location.longitude)
  }
}
