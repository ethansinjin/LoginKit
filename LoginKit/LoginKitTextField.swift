//
//  LoginKitTextField.swift
//  LoginKit
//
//  Created by Ethan eLink on 10/25/16.
//  Copyright © 2016 Ethan Gill. All rights reserved.
//

import UIKit

class LoginKitTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        let startingPoint = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        
        let path = UIBezierPath()
        
        path.move(to: startingPoint)
        path.addLine(to: endingPoint)
        path.lineWidth = 4.0
        
        tintColor.setStroke()
        
        path.stroke()

    }
    
}
