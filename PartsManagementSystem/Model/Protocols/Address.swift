//
//  Address.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

// MARK: Adress
protocol Address {
    var street: String { get }
    var buildingNo: Int { get }
    var flatNo: Int? { get }
    var zipcode: String { get }
    var country: Country { get }
    
    func getAddress() -> String
}

struct StandardAddress: Address {
    var street: String
    var buildingNo: Int
    var flatNo: Int?
    var zipcode: String
    var country: Country
    func getAddress() -> String {
        if let flatNo = flatNo {
            return "\(street) \(buildingNo), flat no: \(flatNo), \(zipcode) \(country.name)"
        } else { return "\(street) \(buildingNo), \(zipcode) \(country.name)" }
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
