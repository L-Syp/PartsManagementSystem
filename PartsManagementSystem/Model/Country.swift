//
//  Country.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

class Country {
    let name: String
    let code: String
    let flag: String
    let tax: Double
    
    init(_ name: String, code: String, flag: String, tax: Double) {
        self.name = name
        self.code = code
        self.flag = flag
        self.tax = tax
    }
}
