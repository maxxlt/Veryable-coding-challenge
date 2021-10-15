//
//  AccountListView.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol AccountListDelegate: AnyObject {}

class AccountListView: UIView, UITableViewDelegate, UITableViewDataSource {

    //MARK: Public API
    func refreshtable(){
        AccountRepo.getAccountList(tableView: self.tableView)
    }
    
    //MARK: Inits
    init(delegate: AccountListDelegate) {
        self.del = delegate
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) { nil }

    private func setup() {
        backgroundColor = ViewColor.background.color
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
        constrain()
        refreshtable()
    }

    private func constrain() {
        tableView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
            $0.top.equalToSuperview().offset(0)
            $0.bottom.equalToSuperview().offset(0)
        }
    }

    //MARK: Overrides
    func numberOfSections(in tableView: UITableView) -> Int {
        return AccountListView.accounts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AccountListView.accounts[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.accessoryType = .disclosureIndicator
        if indexPath.section == 0 {
            cell.accountImg.image = UIImage(named: "bank")?.withRenderingMode(.alwaysTemplate)
            cell.accountType.text = "Bank Account: ACH - Same Day"
        }
        else {
            cell.accountImg.image = UIImage(named: "card")?.withRenderingMode(.alwaysTemplate)
            cell.accountType.text = "Card: Instant"
        }
        cell.accountName.text = AccountListView.accounts[indexPath.section][indexPath.row].account_name
        cell.accountDesc.text = AccountListView.accounts[indexPath.section][indexPath.row].desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected " + String(indexPath.row) + " row")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //MARK: Private members
    private weak var del: AccountListDelegate?
    public static var accounts = [[Account]]()
    private let headerTitles = ["Bank Accounts", "Cards"]

    //MARK: Lazy Loads
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextDemiBold(16)
        addSubview(label)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
}
