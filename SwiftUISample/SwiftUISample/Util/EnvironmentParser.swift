//
//  EnvironmentParser.swift
//  SwiftUISample
//
//  Created by Taillook on 2019/08/03.
//  Copyright © 2019 Taillook. All rights reserved.
//

import Foundation

struct EnvironmentParser {
    func parse() -> Bool {
        guard let path = Bundle.main.path(forResource: ".env", ofType: nil) else {
            fatalError("Not found: '.env' file. Please create .env file")
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let str = String(data: data, encoding: .utf8) ?? "Empty File"
            let clean = str.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "'", with: "")
            let envVars = clean.components(separatedBy:"\n")
            for envVar in envVars {
                let keyVal = envVar.components(separatedBy:"=")
                if keyVal.count == 2 {
                    setenv(keyVal[0], keyVal[1], 1)
                }
            }
        } catch {
            fatalError(error.localizedDescription)
        }

        return true
    }
}
