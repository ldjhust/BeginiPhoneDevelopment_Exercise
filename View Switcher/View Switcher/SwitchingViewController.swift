//
//  SwitchingViewController.swift
//  View Switcher
//
//  Created by ldjhust on 15/12/9.
//  Copyright © 2015年 ldj. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    private var blueViewController: BlueViewController!
    private var yellowViewControleler: YellowViewController!
    
    // MARK: - view lifecycle
    
    override func viewDidLoad() {
        // 初始化属性
        blueViewController = storyboard?.instantiateViewControllerWithIdentifier("Blue") as! BlueViewController
        
        // 配置属性
        blueViewController.view.frame = view.frame
        
        switchViewController(from: nil, to: blueViewController)
    }
    
    override func didReceiveMemoryWarning() {
        // 在内存不足时，释放掉该释放的内存
        if blueViewController != nil && blueViewController.view.superview == nil {
            blueViewController = nil
        }
        
        if yellowViewControleler != nil && blueViewController.view.superview == nil {
            yellowViewControleler = nil
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        if yellowViewControleler?.view.superview == nil {
            if yellowViewControleler == nil {
                yellowViewControleler = storyboard?.instantiateViewControllerWithIdentifier("Yellow") as! YellowViewController
            }
        } else {
            if blueViewController == nil {
                blueViewController = storyboard?.instantiateViewControllerWithIdentifier("Blue") as! BlueViewController
            }
        }
        
        if yellowViewControleler != nil && yellowViewControleler.view.superview == nil {
            yellowViewControleler.view.frame = view.frame
            switchViewController(from: blueViewController, to: yellowViewControleler)
        } else {
            blueViewController.view.frame = view.frame
            switchViewController(from: yellowViewControleler, to: blueViewController)
        }
    }
    
    // MARK: - private methods
    
    private func switchViewController(from fromVC: UIViewController?, to toVC: UIViewController?)
    {
        if let fromVC = fromVC {
            fromVC.willMoveToParentViewController(nil)
            fromVC.view.removeFromSuperview()
            fromVC.removeFromParentViewController()
        }
        
        if let toVC = toVC {
            self.addChildViewController(toVC)
            self.view.insertSubview(toVC.view, atIndex: 0)
            toVC.didMoveToParentViewController(self)
        }
    }
}
