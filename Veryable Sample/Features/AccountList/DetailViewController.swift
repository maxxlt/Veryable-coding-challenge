//
//  DetailViewController.swift
//  Veryable Sample
//
//  Created by Max on 10/15/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    //MARK: Public API

    //MARK: Inits
    init(account: Account) {
        super.init(nibName: nil, bundle: nil)
        self.title = "Details".uppercased()
        self.account = account
    }
    required init?(coder: NSCoder) { nil }

    //MARK: Overrides
    override func loadView() {
        view = customView
    }

    //MARK: Private members
    private var account:Account? = nil
    
    //MARK: Lazy Loads
    private lazy var customView: DetailView = {
        DetailView(delegate: self)
    }()
}

extension DetailViewController: DetailDelegate {
    func getData() -> Account {
        return account!
    }
}
