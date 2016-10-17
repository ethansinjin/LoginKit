//
//  LoginKitSlantedView.swift
//  LoginKit
//
//  Created by Ethan eLink on 10/17/16.
//  Copyright © 2016 Ethan Gill. All rights reserved.
//

import UIKit

@IBDesignable
class LoginKitSlantedView: UIView {

    var slantedLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawPath(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawPath(frame: self.frame)
    }
    
    func drawPath(frame: CGRect) {
        
        let slantPosition = frame.size.height / 16 //6.25 inset
        let topLeft = CGPoint(x: frame.origin.x, y: frame.origin.y)
        let topRightSlant = CGPoint(x: frame.size.width, y: slantPosition)
        let bottomRight = CGPoint(x: frame.size.width, y: frame.size.height)
        let bottomLeft = CGPoint(x: frame.origin.x, y: frame.size.height)
        
        let path = CGMutablePath()
        path.move(to: topLeft)
        path.addLine(to: topRightSlant)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.addLine(to: topLeft)
        
        slantedLayer.path = path
        slantedLayer.shadowColor = UIColor.black.cgColor
        slantedLayer.shadowRadius = 5
        slantedLayer.shadowOpacity = 0.75
        slantedLayer.shadowOffset = CGSize(width: 0, height: -2)
        self.layer.addSublayer(slantedLayer)
    }
    
    override var backgroundColor: UIColor? {
        get {
            if let cgBackgroundColor = self.slantedLayer.fillColor {
                return UIColor(cgColor: cgBackgroundColor)
            }
            return nil
        }
        set {
            self.slantedLayer.fillColor = newValue?.cgColor
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        
//    }

}
