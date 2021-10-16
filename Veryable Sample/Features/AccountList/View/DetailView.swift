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
    func backButton()
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
        data = self.del?.getData()
        constrain()
    }

    private func constrain() {
//        helloLabel.snp.makeConstraints{ (make) in
//            make.center.equalToSuperview()
//        }
        accountImage.snp.makeConstraints{(make) in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.centerX.equalToSuperview()
            make.topMargin.equalToSuperview().offset(32)
        }
        accountName.snp.makeConstraints {(make) in
            make.topMargin.equalTo(accountImage.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        desc.snp.makeConstraints {(make) in
            make.topMargin.equalTo(accountName.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        backButton.snp.makeConstraints{(make) in
            make.left.equalTo(32)
            make.right.equalTo(-32)
            make.bottom.equalTo(-32)
            make.height.equalTo(50)
        }
    }

    //MARK: Overrides
    
    //MARK: Private members
    private weak var del: DetailDelegate?
    private var data:Account? = nil
    
    @objc func backButtonTapped(sender: UIButton!) {
        self.del?.backButton()
    }

    //MARK: Lazy Loads
    private lazy var accountImage: UIImageView = {
        let iv = UIImageView()
        if (data?.account_type == "bank"){
            iv.image = UIImage(named: "bank")?.withRenderingMode(.alwaysTemplate)
        } else {
            iv.image = UIImage(named: "card")?.withRenderingMode(.alwaysTemplate)
        }
        iv.contentMode = .scaleToFill
        iv.tintColor = VBlue.dark.color
        addSubview(iv)
        return iv
    }()
    
    private lazy var accountName: UILabel = {
        let label = UILabel()
        label.text = data?.account_name
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextDemiBold(16)
        addSubview(label)
        return label
    }()
    
    private lazy var desc: UILabel = {
        let label = UILabel()
        label.text = data?.desc
        label.textColor = VGrey.normal.color
        label.font = .vryAvenirNextRegular(14)
        addSubview(label)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("DONE", for: .normal)
        btn.backgroundColor = VBlue.dark.color
        btn.layer.cornerRadius = 2
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        addSubview(btn)
        return btn
    }()
}
