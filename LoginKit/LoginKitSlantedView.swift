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
        drawPath(bounds: bounds)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawPath(bounds: self.bounds)
    }
    
    func drawPath(bounds: CGRect) {
        
        slantedLayer.frame = self.bounds
        let slantPosition = bounds.size.height / 4 //6.25 inset
        let topLeft = CGPoint(x: bounds.origin.x, y: bounds.origin.y)
        let topRightSlant = CGPoint(x: bounds.size.width, y: slantPosition)
        let bottomRight = CGPoint(x: bounds.size.width, y: bounds.size.height)
        let bottomLeft = CGPoint(x: bounds.origin.x, y: bounds.size.height)
        
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
    
    override func layoutSubviews() {
        slantedLayer.frame = self.bounds
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
