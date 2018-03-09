//
//  Country.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

struct Countries: Codable {
    let countries: [Country]
}

struct Country: Codable {
    let name: String
    let code: String
    let flag: String
    let tax: Double
    
    enum CodingKeys : String, CodingKey {
        case code
        case name
        case flag = "emoji"
        case tax
    }
}
