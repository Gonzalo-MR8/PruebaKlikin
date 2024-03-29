//
//  EndPointProtocol.swift
//  PruebaKlikin
//
//  Created by GonzaloMR on 19/2/24.
//

import Foundation

protocol EndPoint {
    var basePath: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var postBody: [String: String]? { get }
    var urlParameters: [String: String]? { get }
    var customHeaders: [String: String]? { get }
}

enum HttpMethod: String {
    case post   = "POST"
    case get    = "GET"
    case delete = "DELETE"
    case put    = "PUT"
}

enum RequestError: Error {
    case invalidURL
    case noData
    case noHttpResponse
    case noInternetConnection
    case statusError(code: Int)
    case unauthorized
    case unknown
}
