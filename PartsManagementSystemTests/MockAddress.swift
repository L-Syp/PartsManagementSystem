//
//  MockAddress.swift
//  PartsManagementSystemTests
//
//  Created by Łukasz Sypniewski on 12/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import XCTest
@testable import PartsManagementSystem

struct MockAddress: AddressProtocol {
    var streetName: String
    var buildingNo: Int
    var flatNo: Int?
    var zipcode: String
    var country: Country
    
    func getStringRepresentation() -> String {
        return ""
    }
}
