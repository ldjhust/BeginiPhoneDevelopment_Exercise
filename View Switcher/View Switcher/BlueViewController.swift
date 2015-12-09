//
//  BlueViewController.swift
//  View Switcher
//
//  Created by ldjhust on 15/12/9.
//  Copyright © 2015年 ldj. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    // MARK: - IBActions
    
    @IBAction func blueButtonPressed(sender: UIButton) {
        let alert = UIAlertController(title: "Blue view button pressed", message: "You pressed the button on the blue view", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Yep, I did", style: .Default, handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
}
