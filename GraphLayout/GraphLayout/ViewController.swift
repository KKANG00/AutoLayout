//
//  ViewController.swift
//  GraphLayout
//
//  Created by KKANG on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var g1Height: NSLayoutConstraint!
    @IBOutlet weak var g2Height: NSLayoutConstraint!
    @IBOutlet weak var g3Height: NSLayoutConstraint!
    @IBOutlet weak var g4Height: NSLayoutConstraint!
    @IBOutlet weak var g5Height: NSLayoutConstraint!
    
    var ascOrder = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // multiplier는 get-only property
//        g1Height.multiplier = 0.5
        // 새로 구성해서 만드는 방법 사용
        drawGraph([0.5,0.6,0.7,0.8,0.9])
    }
    
    func drawGraph(_ multiplierData: [CGFloat]) {
        g1Height = g1Height.changeMultiplier(value: multiplierData[0])
        g2Height = g2Height.changeMultiplier(value: multiplierData[1])
        g3Height = g3Height.changeMultiplier(value: multiplierData[2])
        g4Height = g4Height.changeMultiplier(value: multiplierData[3])
        g5Height = g5Height.changeMultiplier(value: multiplierData[4])
        
        UIView.animate(withDuration: 0.7) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func changeGraph(_ sender: Any) {
        ascOrder = !ascOrder
        
        if ascOrder {
            drawGraph([0.5,0.6,0.7,0.8,0.9])
        }
        else {
            drawGraph([0.9,0.8,0.7,0.6,0.5])
        }
    }
    
}


extension NSLayoutConstraint {
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint {
        
        // 원래 가진 값을 전부 비활성화
        NSLayoutConstraint.deactivate([self])
        
        let newLayoutConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        
        newLayoutConstraint.priority = self.priority
        newLayoutConstraint.shouldBeArchived = self.shouldBeArchived
        newLayoutConstraint.identifier = self.identifier
        
        // 새로 만든걸 다시 활성화
        NSLayoutConstraint.activate([newLayoutConstraint])
        
        return newLayoutConstraint
    }
}
