//
//  DetailView.swift
//  Veryable Sample
//
//  Created by Max on 10/15/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol DetailDelegate: AnyObject {
    func getData() -> Account
}

class DetailView: UIView {

    //MARK: Public API
    
    //MARK: Inits
    init(delegate: DetailDelegate) {
        self.del = delegate
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) { nil }

    private func setup() {
        backgroundColor = ViewColor.background.color
        var data = self.del?.getData()
        print(data)
        constrain()
    }

    private func constrain() {
        helloLabel.snp.makeConstraints{ (make) in
            make.center.equalToSuperview()
        }
    }

    //MARK: Overrides
    
    //MARK: Private members
    private weak var del: DetailDelegate?

    //MARK: Lazy Loads
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextDemiBold(16)
        addSubview(label)
        return label
    }()
}
