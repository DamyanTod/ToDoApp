//
//  ViewAnimationProtocol.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import UIKit

protocol ViewAnimationProtocol {}

extension ViewAnimationProtocol where Self: UIView {
    
    func jitter () {
        
        let key = "viewPosition"
        
        let animation = CABasicAnimation(keyPath: key)
        
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint:CGPoint.init(x: self.center.x - 5, y: self.center.y))
        animation.toValue = NSValue(cgPoint:CGPoint.init(x: self.center.x + 5, y: self.center.y))
        layer.add(animation, forKey: key)
        
    }
    
    func flash () {
        if self.alpha == 0 {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn , animations: {
                self.alpha = 1.0
            }, completion: { (animationComplete) in
                if animationComplete {
                    UIView.animate(withDuration: 0.3, delay: 2.0, options: .curveEaseOut, animations: {
                        self.alpha = 0
                    }, completion: nil)
                }
            })
        }
    }
}
