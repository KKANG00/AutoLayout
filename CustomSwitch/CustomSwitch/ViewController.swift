//
//  ViewController.swift
//  CustomSwitch
//
//  Created by KKANG on 2021/08/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var switchBackground: UIView!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var btnCenter: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButton.layer.cornerRadius = switchButton.bounds.width / 2
        switchBackground.layer.cornerRadius =
            switchBackground.bounds.height / 2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func swichPressed(_ sender: Any) {
        btnCenter.constant = (btnCenter.constant <= 0) ? 10.5 : -10.5
        
//        UIView.animate(withDuration: 0.3) {
//            self.view.layoutIfNeeded()
//        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            
        }
        
        switchBackground.backgroundColor = (btnCenter.constant <= 0) ? .systemGray5 : .systemGreen
    }
}

