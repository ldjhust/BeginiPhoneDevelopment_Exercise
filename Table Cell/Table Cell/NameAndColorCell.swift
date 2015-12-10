//
//  NameAndColorCell.swift
//  Table Cell
//
//  Created by ldjhust on 15/12/10.
//  Copyright © 2015年 ldj. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    var name: String = "" {
        didSet {
            if name != oldValue {
                nameLabel.text = name
            }
        }
    }
    var color: String = "" {
        didSet {
            if color != oldValue {
                colorLabel.text = color
            }
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
}
