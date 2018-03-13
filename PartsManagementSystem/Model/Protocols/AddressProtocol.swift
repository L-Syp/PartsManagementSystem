//
//  Address.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

protocol AddressProtocol {
    var streetName: String { get }
    var buildingNo: Int { get }
    var flatNo: Int? { get }
    var zipcode: String { get }
    var country: Country { get }
    
    func getStringRepresentation() -> String
}
