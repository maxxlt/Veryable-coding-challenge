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
    private let accounts: [Account] = AccountRepo.getAccountList()
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = accounts[indexPath.row].getName()
        return cell
    }
    
    //MARK: Private members
    private weak var del: AccountListDelegate?

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
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
}
