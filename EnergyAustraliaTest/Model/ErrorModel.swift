//
//  ErrorModel.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 22/01/23.
//

import Foundation

enum APIError: String, Error {
    case badURL = "URL not correct"
    case networkError = "Nertwork error"
    case unableToFectchData = "API returning no Data"
    case unableToParseData = "Unable to parse data"
    case noData = "No data in response"
    case unknown = "Unknown error"
    case decodeError = "Unable to Decode response data"
    case throttleError = "Too many requests, throttling"
}
