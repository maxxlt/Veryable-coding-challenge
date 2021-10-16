//
//  CustommTableViewCell.swift
//  Veryable Sample
//
//  Created by Max on 10/15/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    var accountImg = UIImageView()
    var accountName = UILabel()
    var accountDesc = UILabel()
    var accountType = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    func configure() {
        accountImg.contentMode = .scaleToFill
        accountImg.tintColor = VBlue.normal.color
        self.addSubview(accountImg)
        accountImg.snp.makeConstraints{ (make) in
            make.top.left.equalTo(22)
        }
        accountName.font = UIFont.vryAvenirNextDemiBold(14.0)
        accountName.textColor = VGrey.normal.color
        self.addSubview(accountName)
        accountName.snp.makeConstraints { (make) in
            make.leading.equalTo(accountImg.snp.trailing).offset(16)
            make.topMargin.equalToSuperview().offset(22)
        }
        accountDesc.font = UIFont.vryAvenirNextRegular(12)
        accountDesc.textColor = VGrey.normal.color
        self.addSubview(accountDesc)
        accountDesc.snp.makeConstraints { (make) in
            make.leading.equalTo(accountImg.snp.trailing).offset(16)
            make.topMargin.equalTo(accountName.snp.bottom).offset(8)
        }
        accountType.font = UIFont.vryAvenirNextRegular(12)
        accountType.textColor = VGrey.light.color
        self.addSubview(accountType)
        accountType.snp.makeConstraints { (make) in
            make.leading.equalTo(accountImg.snp.trailing).offset(16)
            make.topMargin.equalTo(accountDesc.snp.bottom).offset(8)
        }
    }
    
    required init?(coder currentCoder: NSCoder){
        super.init(coder: currentCoder)
    }
}
