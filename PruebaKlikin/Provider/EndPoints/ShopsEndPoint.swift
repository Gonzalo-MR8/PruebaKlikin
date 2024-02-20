//
//  ShopsEndPoint.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 19/2/24.
//

import Foundation

enum ShopsEndPoint {
  case getShops
}

extension ShopsEndPoint: EndPoint {
    var basePath: String {
        "https://waylet-web-export.s3.eu-west-1.amazonaws.com/"
    }

    var path: String {
        switch self {
        case .getShops:
            return "commerces.json"
        }
    }

    var method: HttpMethod { .get }

    var postBody: [String: String]? { nil }

    var urlParameters: [String: String]? { nil }

    var customHeaders: [String: String]? { 
      ["Content-Type": "application/json"]
    }
}
