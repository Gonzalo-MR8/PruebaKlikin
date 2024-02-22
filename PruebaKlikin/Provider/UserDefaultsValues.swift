//
//  UserDefaultsValues.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 21/2/24.
//

import Foundation

extension UserDefaults {
  struct UserDefaultKeys {
    static let kLastLocation = "LastLocation"
  }

  // MARK: - LastLocation
  var lastLocation: Location? {
    get {
      guard let lastLocation = get(objectType: Location.self, forKey: UserDefaultKeys.kLastLocation) else { return nil }

      return lastLocation
    }
    set {
      set(object: newValue, forKey: UserDefaultKeys.kLastLocation)
    }
  }
}
