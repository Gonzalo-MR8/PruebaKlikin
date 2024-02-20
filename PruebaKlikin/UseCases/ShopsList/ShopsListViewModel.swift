//
//  ShopsListViewModel.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 19/2/24.
//

import Foundation

final class ShopsListViewModel {

    private var shops: Shops
    private let services: ShopsServiceable

    init() {
      shops = []
      self.services = ShopsServices()
    }

    func getShops() -> Shops {
        return shops
    }

    func callShops() async throws {
      shops = try await services.getShops()
    }
}
