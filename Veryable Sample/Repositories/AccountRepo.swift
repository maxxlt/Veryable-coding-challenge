//
//  AccountRepo.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation

class AccountRepo {
    static public func getAccountList() -> [Account] {
        var accountArr = [Account]()
        guard let dataPath = Bundle.main.path(forResource: "dummy-data", ofType: "json") else {
            //if we couldn't find the path, return empty [Account]
            return accountArr
        }
        let dataURL = URL(fileURLWithPath: dataPath)
        do {
            let data = try Data(contentsOf: dataURL)
            let jsonData = try JSONDecoder().decode(Accounts.self, from: data)
            print(jsonData.data)
            accountArr = jsonData.data
        } catch {
            print(error)
        }
        return accountArr
    }
}
