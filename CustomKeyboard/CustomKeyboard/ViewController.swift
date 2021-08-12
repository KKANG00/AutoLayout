//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by KKANG on 2021/08/12.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {

    @IBOutlet weak var firstField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let customKeyboard = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)?.first as! CustomKeyboard
        customKeyboard.delegate = self
        
        firstField.inputView = customKeyboard
    }
    
    func sendValue(value: String) {
        if let text = firstField.text {
            if value == "<" {
                firstField.text = String(text.dropLast())
                return
            }
            firstField.text = text + value
        }
        else {
            firstField.text = value
        }
    }
    
}

