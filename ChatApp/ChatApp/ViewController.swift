//
//  ViewController.swift
//  ChatApp
//
//  Created by KKANG on 2021/08/27.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var chatTableView: UITableView! {
        didSet {
            chatTableView.delegate = self
            chatTableView.dataSource = self
        }
    }
    var chatData = [String]()
    @IBOutlet weak var inputTextField: UITextView!{
        didSet {
            inputTextField.delegate = self
        }
    }
    @IBOutlet weak var inputViewBottom: NSLayoutConstraint!
    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!
    
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
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        inputViewBottom.constant = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
        
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        let notiInfo = noti.userInfo!
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval

        inputViewBottom.constant = 0
        
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        chatData.append(inputTextField.text)
        inputTextField.text = ""
        
//        chatTableView.reloadData()
        chatTableView.insertRows(at: [IndexPath(row: chatData.count-1, section: 0)], with: UITableView.RowAnimation.automatic)
        
        chatTableView.scrollToRow(at: IndexPath(row: chatData.count-1, section: 0), at: .bottom, animated: true)
    }
    
    //MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let mycell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyTableViewCell
            mycell.myTextView.text = chatData[indexPath.row]
            mycell.date.text = getDate()
            
            return mycell
        } else {
            let yourcell = tableView.dequeueReusableCell(withIdentifier: "YourCell", for: indexPath) as! YourTableViewCell
            yourcell.yourTextView.text = chatData[indexPath.row]
            yourcell.date.text = getDate()
            
            return yourcell
        }
    }
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "MM/dd HH:mm"

        let dateString = formatter.string(from: Date())
        
        return dateString
    }
    
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height <= 40 {
            inputTextViewHeight.constant = 40
        } else if textView.contentSize.height >= 100 {
            inputTextViewHeight.constant  = 100
        } else {
            inputTextViewHeight.constant = textView.contentSize.height
        }

    }
}
