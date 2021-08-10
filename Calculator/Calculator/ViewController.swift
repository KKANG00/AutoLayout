//
//  ViewController.swift
//  Calculator
//
//  Created by KKANG on 2021/08/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel.layer.cornerRadius = 30
        // button은 자동으로 설정되지만 lable 등은 아래 속성 중 하나를 변경해줘야한다.
        displayLabel.layer.masksToBounds = true
//        displayLabel.clipsToBounds = true
    }


}

