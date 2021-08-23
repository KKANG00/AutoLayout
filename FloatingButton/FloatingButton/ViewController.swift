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

//class ScreenProtector {
//    private var warningWindow: UIWindow?
//
//    private var window: UIWindow? {
//        return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
//    }
//
//    func startPreventingRecording() {
//        NotificationCenter.default.addObserver(self, selector: #selector(didDetectRecording), name: UIScreen.capturedDidChangeNotification, object: nil)
//    }
//
//    @objc private func didDetectRecording() {
//        DispatchQueue.main.async {
//            self.hideScreen()
////            self.presentWarningWindow()
//        }
//    }
//    
//    private func hideScreen() {
//        print(UIScreen.main.isCaptured)
//    }
//}
