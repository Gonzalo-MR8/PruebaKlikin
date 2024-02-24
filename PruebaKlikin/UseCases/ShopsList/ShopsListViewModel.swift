//
//  ShopsListViewModel.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 19/2/24.
//

import Foundation
import CoreLocation

final class ShopsListViewModel {

  private var allShops: Shops
  private var filteredShops: Shops
  private var shopsDistance: [CLLocationDistance]
  private let services: ShopsServiceable
  private var selectedCategory: Category?

  init() {
    allShops = []
    filteredShops = []
    shopsDistance = []
    self.services = ShopsServices()
  }

  func getShops() -> Shops {
    filteredShops
  }

  func getShop(index: Int) -> Shop {
    filteredShops[index]
  }

  private func sortShopsByDistance() {
    let lastUserLocation: CLLocation = LocationManager.shared.lastUserLocation

    filteredShops.sort { (shop1, shop2) -> Bool in
      let distancia1 = shop1.location.location.distance(from: lastUserLocation)
      let distancia2 = shop2.location.location.distance(from: lastUserLocation)
      return distancia1 < distancia2
    }

    shopsDistance = []
    filteredShops.forEach { shop in
      let distance = shop.location.location.distance(from: LocationManager.shared.lastUserLocation)

      shopsDistance.append(distance / 1000)
    }
  }

  func categorySelected(category: Category) {
    if selectedCategory == category {
      selectedCategory = nil
      filteredShops = allShops
    } else {
      selectedCategory = category
      filteredShops = allShops.filter({ $0.category == category })
    }

    sortShopsByDistance()
  }

  func getSelectedCategory() -> Category? {
    selectedCategory
  }

  func callShops() async throws {
    allShops = try await services.getShops()
    filteredShops = allShops
    sortShopsByDistance()
  }

  func getNumberOfShopsPerDistance(distance: Int) -> Int {
    shopsDistance.filter({ Int(ceil($0)) <= distance }).count
  }
}
