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
  let location: Location
  let openingHours: String
  let address: Address
  let id: Int

  private enum CodingKeys: String,CodingKey {
    case photo
    case name
    case category
    case cashback
    case location
    case openingHours
    case address
    case id = "_id"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    photo = try container.decode(String.self, forKey: .photo)
    name = try container.decode(String.self, forKey: .name)
    category = try container.decode(Category.self, forKey: .category)
    cashback = try container.decode(Double.self, forKey: .cashback)

    let locationInit = try container.decode([Double].self, forKey: .location)

    if let latitude = locationInit.last, let longitude = locationInit.first {
      location = Location(latitude: latitude, longitude: longitude)
    } else {
      throw DecodingError.dataCorruptedError(forKey: .location, in: container,debugDescription: "Location data does not match format expected by formatter.")
    }

    openingHours = try container.decode(String.self, forKey: .openingHours)
    address = try container.decode(Address.self, forKey: .address)
    id = try container.decode(Int.self, forKey: .id)
  }
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
