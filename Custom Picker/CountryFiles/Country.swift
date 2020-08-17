//
//  Country.swift
//  CountriesFlagsAndCodes
//
//  Created by Stewart Lynch on 2020-04-23.
//  Copyright © 2020 Stewart Lynch. All rights reserved.
//

import Foundation

    struct Country: Identifiable,Codable {
        var id: UUID? = UUID()
        let name: String
        let code: String
        let flag: String
        let appStore: Bool
    }

