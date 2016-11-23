//
//  UIView+Shake.swift
//  LoginKit
//
//  Created by Ethan eLink on 11/23/16.
//  Copyright © 2016 Ethan Gill. All rights reserved.
//

import UIKit

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [ -20, 20, -20, 20, -10, 10, -5, 5, 0]
        layer.add(animation, forKey: "shake")
    }
}
