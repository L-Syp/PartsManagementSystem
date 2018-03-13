//
//  Address.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 09/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation

// MARK: Adress
struct Address: AddressProtocol {
    var streetName: String
    var buildingNo: Int
    var flatNo: Int?
    var zipcode: String
    var country: Country
    
    func getStringRepresentation() -> String {
        if let flatNo = flatNo {
            return "\(streetName) \(buildingNo), flat no: \(flatNo), \(zipcode) \(country.name)"
        } else { return "\(streetName) \(buildingNo), \(zipcode) \(country.name)" }
    }
}

// MARK: Coordinates
struct Coordinates: Codable {
    let coordinates: [Coordinate]
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}

