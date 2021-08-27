//
//  ViewController.swift
//  ChatApp
//
//  Created by KKANG on 2021/08/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var inputTextField: UITextView!
    @IBOutlet weak var inputViewBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        chatTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        chatTableView.register(UINib(nibName: "YourTableViewCell", bundle: nil), forCellReuseIdentifier: "YourCell")
        
        // keyboard UP
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // keyboard DOWN
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(noti: Notification) {
        let notiInfo = noti.userInfo
        let keyboardFrame = notiInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        inputViewBottom.constant = keyboardFrame.size.height
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        inputViewBottom.constant = 0
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        
    }
    

}

