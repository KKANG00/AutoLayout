//
//  DiagonalCustomImageView.swift
//  CodeView
//
//  Created by KKANG on 2021/08/23.
//

import UIKit

// storyBoard 화면에서 확인할 수 있도록 하기
@IBDesignable
class DiagonalCustomImageView: UIImageView {
    
    @IBInspectable var innerHeight: CGFloat = 50
    // 사각형 그리기
    // bezierPath
    func makePath() -> UIBezierPath{
        let path = UIBezierPath()
        // 시작점
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to:  CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        path.close()
        
        return path
    }
    
    // path -> ayer
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        
        return shapeLayer
    }
    
    // masking
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
    
    override func layoutSubviews() {
        makeMask()
    }

}
