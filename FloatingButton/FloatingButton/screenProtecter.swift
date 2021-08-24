//
//  screenProtecter.swift
//  FloatingButton
//
//  Created by KKANG on 2021/08/24.
//

import Foundation
import UIKit

class ScreenProtector {
    
    private var warningWindow: UIWindow?

    private var window: UIWindow? {
        return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
    }
    
    func startPreventingScreenshot() {
        NotificationCenter
            .default.addObserver(self, selector: #selector(didDetectScreenshot), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
    }

    func startPreventingRecording() {
        NotificationCenter.default.addObserver(self, selector: #selector(didDetectRecording), name: UIScreen.capturedDidChangeNotification, object: nil)
    }

    @objc private func didDetectScreenshot() {
        print("didDetectScreenshot")
        
        let alert = UIAlertController(title: "스크린캡처가 감지되었습니다.", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)

        alert.addAction(cancelAction)

        DispatchQueue.main.async {
            self.hideScreen()
            
//            UIApplication.shared.keyWindow?.rootViewController
            if var topController = self.window?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.present(alert, animated: false, completion: nil)
            }
            
        }
    }
    
    @objc private func didDetectRecording() {
        DispatchQueue.main.async {
            self.hideScreen()
        }
    }
    
    private func hideScreen() {
        if UIScreen.main.isCaptured {
            window?.isHidden = true
        } else {
            window?.isHidden = false
        }
    }
    
}
