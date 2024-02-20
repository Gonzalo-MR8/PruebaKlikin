//
//  ShopsServices.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 19/2/24.
//

import Foundation

/// It conforms to the Serviceable protocol, which is critical for testing and dependency injection.
protocol ShopsServiceable {
    func getShops() async throws -> Shops
}

struct ShopsServices: NetworkClient, ShopsServiceable {
  func getShops() async throws -> Shops {
    return try await sendRequest(endPoint: ShopsEndPoint.getShops, responseModel: Shops.self)
  }
}
