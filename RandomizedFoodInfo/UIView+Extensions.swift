//
//  UIView+Extensions.swift
//  Lifesum Challenge
//
//  Created by Marco Giustozzi on 2019-07-12.
//  Copyright © 2019 marcog. All rights reserved.
//

import UIKit

extension UIView {
    
    func shake(count : Float = 4,for duration : TimeInterval = 0.5,withTranslation translation : Float = 5) {
        
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
    
    func stopShake() {
        layer.removeAllAnimations()
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            if layer.borderColor != nil { return UIColor(cgColor: layer.borderColor!)}
            else {return nil}
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
        get {
            return layer.borderWidth
        }
    }
}
