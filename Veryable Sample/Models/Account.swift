//
//  Account.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation

struct Account : Codable {
    let name: String
    let account: String
    let type: String
    
    public func getName() -> String{
        return name
    }
}
