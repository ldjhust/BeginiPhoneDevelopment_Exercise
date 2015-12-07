//
//  ViewController.swift
//  Button Fun
//
//  Created by ldjhust on 15/12/2.
//  Copyright © 2015年 ldj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var statusLabel: UILabel!
  
  @IBAction func buttonPressed(sender: UIButton) {
    let title = sender.titleForState(.Normal)!
    let plainText = "\(title) button pressed"
    let styleText = NSMutableAttributedString(string: plainText)
    let attributes = [NSFontAttributeName : UIFont.boldSystemFontOfSize(statusLabel.font.pointSize),
                      NSForegroundColorAttributeName : UIColor.redColor()]
    let range = (plainText as NSString).rangeOfString(title)
    
//    let f = CABasicAnimation(keyPath: "path")
//    f.timingFunction // 贝塞尔插值
    
    styleText.setAttributes(attributes, range: range)
    statusLabel.attributedText = styleText
  }
}

