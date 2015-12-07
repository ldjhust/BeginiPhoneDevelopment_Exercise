//
//  ViewController.swift
//  Control Fun
//
//  Created by ldjhust on 15/12/7.
//  Copyright © 2015年 ldj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - IBOutlet
  
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var numberField: UITextField!
  @IBOutlet weak var sliderLabel: UILabel!
  @IBOutlet weak var leftSwitch: UISwitch!
  @IBOutlet weak var rightSwitch: UISwitch!
  @IBOutlet weak var doSomethingButton: UIButton!
  
  // MARK: - view lifecycle
  
  override func viewDidLoad() {
    sliderLabel.text = "50"
  }
  
  // MARK: - IBAction
  
  @IBAction func textFieldDidEndExit(sender: UITextField) {
    sender.resignFirstResponder()
  }
  
  @IBAction func backgroundTap(sender: UITextField) {
    nameField.resignFirstResponder()
    numberField.resignFirstResponder()
  }
  
  @IBAction func sliderChanger(sender: UISlider) {
    let progress: Int = lroundf(sender.value)
    sliderLabel.text = "\(progress)"
  }
  
  @IBAction func switchChanged(sender: UISwitch) {
    let setting = sender.on
    leftSwitch.setOn(setting, animated: true)
    rightSwitch.setOn(setting, animated: true)
  }
  
  @IBAction func buttonPressed(sender: UIButton) {
    let controller = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .ActionSheet)
    let yesAction = UIAlertAction(title: "Yes, I'm sure!",
                                  style: .Destructive,
                                handler: { action in
      let msg = self.nameField.text!.isEmpty ? "You can breathe easy, every went OK."
                                  : "You can breathe ease, \(self.nameField.text!), every went OK."
      let controller2 = UIAlertController(title: "Something was done", message: msg, preferredStyle: .Alert)
      let cancelAction = UIAlertAction(title: "Phew!", style: .Cancel, handler: nil)
                                  
      controller2.addAction(cancelAction)
      self.presentViewController(controller2, animated: true, completion: nil)
    })
    let noAction = UIAlertAction(title: "No way!", style: .Cancel, handler: nil)
    
    controller.addAction(yesAction)
    controller.addAction(noAction)
    
    if let ppc = controller.popoverPresentationController {
      ppc.sourceView = sender
      ppc.sourceRect = sender.bounds
    }
    
    presentViewController(controller, animated: true, completion: nil)
  }
  
  @IBAction func toggleControls(sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 0 {
      leftSwitch.hidden = false
      rightSwitch.hidden = false
      doSomethingButton.hidden = true
    } else {
      leftSwitch.hidden = true
      rightSwitch.hidden = true
      doSomethingButton.hidden = false
    }
  }
}

