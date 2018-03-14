//
//  MockProductManager.swift
//  PartsManagementSystemTests
//
//  Created by Łukasz Sypniewski on 12/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import XCTest
@testable import PartsManagementSystem

enum MockError: Error {
    case mockError
}

class MockProductManager: ProductManaging {
    // MARK: Properties
    private(set) var vendor: Vendor
    
    // MARK: Functions
    
    //MARK: Initializers
    init(vendor: Vendor) {
        self.vendor = vendor
    }
}
