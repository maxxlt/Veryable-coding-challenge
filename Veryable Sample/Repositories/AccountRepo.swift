//
//  AccountRepo.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import Alamofire

class AccountRepo {
    static public func getAccountList(tableView: UITableView) {
        AF.request("https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: [Account].self){ (response) in
                guard let accounts = response.value else {return}
                var bank = [Account]()
                var card = [Account]()
                for account in accounts {
                    if account.account_type == "bank" {
                        bank.append(account)
                    }
                    else {
                        card.append(account)
                    }
                }
                AccountListView.accounts = [bank, card]
                tableView.reloadData()
            }
    }
}
