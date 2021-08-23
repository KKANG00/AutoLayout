//
//  FloatingViewController.swift
//  FloatingButton
//
//  Created by KKANG on 2021/08/23.
//

import UIKit

class FloatingViewController: UIViewController {

    @IBOutlet weak var btn1CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn2CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn3CenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1CenterY.constant = 0
        btn2CenterY.constant = 0
        btn3CenterY.constant = 0

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 일정한 속도 간격으로 움직이는 animation
//        UIView.animate(withDuration: 0.5) {
//            self.btn1CenterY.constant = 80
//            self.btn2CenterY.constant = 160
//            self.btn3CenterY.constant = 240
//
//            // 화면 갱신 꼭 필요
//            self.view.layoutIfNeeded()
//        }
        
        animate(btn1Y: 80, btn2Y: 160, btn3Y: 240, duration: 1, completion: {})

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func dimissFloating(_ sender: Any) {
        animate(btn1Y: 0, btn2Y: 0, btn3Y: 0, duration: 0.5) {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func animate(btn1Y: CGFloat, btn2Y: CGFloat, btn3Y: CGFloat, duration: TimeInterval, completion: @escaping () -> Void) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.btn1CenterY.constant = btn1Y
            self.btn2CenterY.constant = btn2Y
            self.btn3CenterY.constant = btn3Y
            
            // 화면 갱신 꼭 필요
            self.view.layoutIfNeeded()
        } completion: { _ in completion() }
    }
    
}
