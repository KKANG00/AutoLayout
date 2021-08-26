//
//  ViewController.swift
//  Popup
//
//  Created by KKANG on 2021/08/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showPopup(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "PopupviewController", bundle: nil)
        let popupVC = storyBoard.instantiateViewController(identifier: "popupVC")
        
        popupVC.modalPresentationStyle = .fullScreen
        popupVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupVC, animated: false, completion: nil)
    }
    
}

