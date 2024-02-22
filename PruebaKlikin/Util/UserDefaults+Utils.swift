//
//  UserDefaults+Utils.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 21/2/24.
//

import Foundation

extension UserDefaults {

  // Check objects
  static func exists(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
  }

  // Store/Retrieve custom objects

  /// Set Codable object into UserDefaults
  ///
  /// - Parameters:
  ///   - object: Codable Object
  ///   - forKey: Key string
  public func set<T: Codable>(object: T?, forKey: String) {
    guard let object = object else {
      removeObject(forKey: forKey)

      synchronize()

      return
    }

    let jsonData = try! JSONEncoder().encode(object)

    set(jsonData, forKey: forKey)

    synchronize()
  }

  /// Get Codable object into UserDefaults
  ///
  /// - Parameters:
  ///   - object: Codable Object
  ///   - forKey: Key string
  public func get<T: Codable>(objectType: T.Type, forKey: String) -> T? {

    guard let result = value(forKey: forKey) as? Data else {
      return nil
    }

    return try! JSONDecoder().decode(objectType, from: result)
  }
}
