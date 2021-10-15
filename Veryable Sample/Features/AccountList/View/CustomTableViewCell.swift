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
    var accountNumber = UILabel()
    var accountType = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.systemBlue
    }
    required init?(coder currentCoder: NSCoder){
        super.init(coder: currentCoder)
    }
}
