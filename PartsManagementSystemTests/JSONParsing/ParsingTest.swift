//
//  CountriesParsingTest.swift
//  PartsManagementSystemTests
//
//  Created by Łukasz Sypniewski on 15/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import XCTest
@testable import PartsManagementSystem

class CountriesParsingTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testParsingCountries() {
        do {
            let countries: Countries?  = try JSONParser.parse(from: "countriesList")!
            let countriesArray = countries!.countries
            XCTAssert(countriesArray.count > 0)
        } catch {}
    }
    
    func testParsingCoordinates() {
        do {
            let coordinates: Coordinates?  = try JSONParser.parse(from: "coordinates")!
            let coordinatesArray = coordinates!.coordinates
            XCTAssert(coordinatesArray.count > 0)
        } catch {}
    }
}
