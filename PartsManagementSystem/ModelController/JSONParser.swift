//
//  JSONParser.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 15/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation

class JSONParser {
    
    static func parse<T>(from localJSONFileName: String) throws -> T? where T: Decodable {
        do {
            let localFilePath = Bundle.main.path(forResource: localJSONFileName, ofType: "json")!
            let jsonString = try NSString(contentsOfFile: localFilePath, encoding: String.Encoding.utf8.rawValue)
            let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue)!
            let decoder = JSONDecoder()
            let decodedData = try! decoder.decode(T.self, from: jsonData)
            return decodedData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    private init() {}
}
