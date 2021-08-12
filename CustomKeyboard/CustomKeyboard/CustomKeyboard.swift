//
//  CustomKeyboard.swift
//  CustomKeyboard
//
//  Created by KKANG on 2021/08/12.
//

import UIKit

protocol CustomKeyboardDelegate {
    func sendValue(value: String)
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyboardDelegate?
    
    @IBAction func buttonTap(_ sender: UIButton) {
        let value = sender.titleLabel?.text
        delegate?.sendValue(value: value!)
    }
}
