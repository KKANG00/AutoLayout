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
    
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(switchTapped))
        switchBackground.addGestureRecognizer(gesture)
    }
    
    @objc func switchTapped(sender : UITapGestureRecognizer) {
        // Do what you want
        swichPressed(self)
    }
    
    @IBAction func swichPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .showHideTransitionViews) {
            self.btnCenter.constant = (self.btnCenter.constant <= 0) ? 5.25 : -5.25

            self.view.layoutIfNeeded()
        } completion: { _ in

        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.btnCenter.constant = (self.btnCenter.constant > 0) ? 10.5 : -10.5
            self.switchBackground.backgroundColor = (self.btnCenter.constant <= 0) ? .systemGray5 : .systemGreen
            
            self.view.layoutIfNeeded()
        } completion: { _ in

        }
        
    }
}

