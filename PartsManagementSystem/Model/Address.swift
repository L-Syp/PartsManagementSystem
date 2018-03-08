//
//  Address.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

protocol Address {
    var street: String { get }
    var buildingNo: Int { get }
    var flatNo: Int? { get }
    var zipcode: String { get }
    var country: Country { get }
    
   func getAddress() -> String
}

struct Coordinates {
    let latitude: Double
    let longitude: Double
}
