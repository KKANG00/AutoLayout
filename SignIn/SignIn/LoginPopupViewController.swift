//
//  LoginPopupViewController.swift
//  SignIn
//
//  Created by 강지우 on 2021/10/02.
//

import UIKit

class LoginPopupViewController: UIViewController {

    var email: String?
    @IBOutlet weak var userLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        userLabel.text = "\(email ?? "") 님,"
    }
    
    @IBAction func CloseButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
