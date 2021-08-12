//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by KKANG on 2021/08/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let customKeyboard = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        firstField.inputView = customKeyboard?.first as! CustomKeyboard
        
    }
    
}

