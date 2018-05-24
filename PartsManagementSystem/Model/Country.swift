//
//  Country.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation

struct Countries: Codable {
    let countries: [Country]
}

struct Country: Codable {
    let name: String
    let code: String
    let flag: String
    let tax: Decimal
    
    enum CodingKeys : String, CodingKey {
        case code
        case name
        case flag = "emoji"
        case tax
    }
    
    static func getCountryName(from countries: [Country], forCode countryCode: String) -> String? {
        guard let filtered = filterCountriesByCode(from: countries, code: countryCode) else { return nil }
        return filtered.name
    }
    
    static func getCountryFlag(from countries: [Country], forCode countryCode: String) -> String? {
        guard let filtered = filterCountriesByCode(from: countries, code: countryCode) else { return nil }
        return filtered.flag
    }
    
    private static func filterCountriesByCode(from countries: [Country], code countryCode: String) -> Country? {
        let filtered = countries.filter{ $0.code == countryCode }
        guard filtered.count == 1 else { return nil }
        return filtered[0]
    }
}
