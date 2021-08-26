//
//  ViewController.swift
//  SignIn
//
//  Created by KKANG on 2021/08/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailErrorMsg: UILabel!
    @IBOutlet weak var passwordErrorMsg: UILabel!
    
    var emailErrorMsgHeight: NSLayoutConstraint?
    var passwordErrorMsgHeight: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailErrorMsg.isHidden = true
        passwordErrorMsg.isHidden = true
        
        emailErrorMsgHeight = emailErrorMsg.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorMsgHeight = passwordErrorMsg.heightAnchor.constraint(equalToConstant: 0)
        
        emailTextField.addTarget(self, action: #selector(textFieldEditing), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEditing), for: .editingChanged)
    }
    
    @objc func textFieldEditing(textField: UITextField) {
        if textField == emailTextField {
            if !isValidEmail(emailString: textField.text) {
                emailErrorMsg.isHidden = false
                // height를 0으로 설정하여 그 공간까지 없앰
//                emailErrorMsgHeight?.isActive = true
//                passwordErrorMsgHeight?.isActive = true
            }
            else {
                emailErrorMsg.isHidden = true
//                emailErrorMsgHeight?.isActive = false
//                passwordErrorMsgHeight?.isActive = false
            }
        }
        else if textField == passwordTextField {
            if let length = textField.text?.count, length < 8 {
                passwordErrorMsg.isHidden = false
            }
            else {
                passwordErrorMsg.isHidden = true
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            // 해당 시간만큼 계속 로드
            // 높이 조절하는 경우 좀 더 스무스하게 움직이도록
            self.view.layoutIfNeeded()
        }
    }
    
    func isValidEmail(emailString: String?) -> Bool {
        guard let email = emailString else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        
        return pred.evaluate(with: email)
    }

}

