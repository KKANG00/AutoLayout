//
//  ViewController.swift
//  FloatingButton
//
//  Created by KKANG on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFloatingButtons" {
            let FloatingVC = segue.destination as! FloatingViewController
            FloatingVC.modalPresentationStyle = .overCurrentContext
        }
    }

}
