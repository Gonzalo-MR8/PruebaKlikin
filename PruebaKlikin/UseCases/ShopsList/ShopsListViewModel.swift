//
//  ShopsListViewModel.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 19/2/24.
//

import Foundation

final class ShopsListViewModel {

  private var allShops: Shops
  private var filteredShops: Shops
  private let services: ShopsServiceable
  private var selectedCategory: Category?

  init() {
    allShops = []
    filteredShops = []
    self.services = ShopsServices()
  }

  func getShops() -> Shops {
    filteredShops
  }

  func categorySelected(category: Category) {
    if selectedCategory == category {
      selectedCategory = nil
      filteredShops = allShops
    } else {
      selectedCategory = category
      filteredShops = allShops.filter({ $0.category == category })
    }
  }

  func getSelectedCategory() -> Category? {
    selectedCategory
  }

  func callShops() async throws {
    allShops = try await services.getShops()
    filteredShops = allShops
  }
}
