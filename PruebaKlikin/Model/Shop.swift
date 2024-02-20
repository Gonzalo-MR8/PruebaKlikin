//
//  Shop.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 19/2/24.
//

import Foundation

typealias Shops = [Shop]

// MARK: - Shop
struct Shop: Codable {
  let photo: String
  let name: String
  let category: Category
  let cashback: Double
  let location: [Double]
  let openingHours: String
  let address: Address
}

// MARK: - Address
struct Address: Codable {
  let street, city: String
  let state, zip: String?
  let country: Country
}

enum Country: String, Codable {
  case empty = ""
  case es = "ES"
  case españa = "España"
  case spain = "SPAIN"
}

enum Category: String, Codable {
  case beauty = "BEAUTY"
  case directSales = "DIRECT_SALES"
  case electricStation = "ELECTRIC_STATION"
  case food = "FOOD"
  case gasStation = "GAS_STATION"
  case leisure = "LEISURE"
  case shopping = "SHOPPING"
}
