//
//  UIView+animations.swift
//  exstendedAnimation
//
//  Created by Dan Leonard on 2/17/16.
//  Copyright © 2016 MacMeDan. All rights reserved.
//

import UIKit

extension UIView{
    func getTimingFunction(curve:CAMediaTimingFunction)->CAMediaTimingFunction{
        return curve
    }
    //shake a view latterally.
    func shake(){
        let shake = CABasicAnimation(keyPath: "position")
        let distance = CGFloat(10)
        shake.duration = 0.12
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let from_point = CGPointMake(self.center.x - distance, self.center.y)
        let from_value = NSValue(CGPoint: from_point)
        
        let to_point = CGPointMake(self.center.x + distance, self.center.y)
        let to_value = NSValue(CGPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        shake.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        self.layer.addAnimation(shake, forKey: "position")
    }
    
    func morph(){
        let repeatCount = Float(1)
        let delay = 0
        let duration = 0.7
        let force = 1.0
        let curve = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let morphX = CAKeyframeAnimation()
        morphX.keyPath = "transform.scale.x"
        morphX.values = [1, 1.3*force, 0.7, 1.3*force, 1]
        morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        morphX.timingFunction = curve
        morphX.duration = CFTimeInterval(duration)
        morphX.repeatCount = repeatCount
        morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        layer.addAnimation(morphX, forKey: "morphX")
        
        let morphY = CAKeyframeAnimation()
        morphY.keyPath = "transform.scale.y"
        morphY.values = [1, 0.7, 1.3*force, 0.7, 1]
        morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        morphY.timingFunction = curve
        morphY.duration = CFTimeInterval(duration)
        morphY.repeatCount = repeatCount
        morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        layer.addAnimation(morphY, forKey: "morphY")
    }
    
    func pop(){
        let repeatCount = Float(1)
        let delay = 0
        let duration = 0.7
        let force = 1.0
        let curve = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.scale"
        animation.values = [0, 0.2*force, -0.2*force, 0.2*force, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.timingFunction = getTimingFunction(curve)
        animation.duration = CFTimeInterval(duration)
        animation.additive = true
        animation.repeatCount = repeatCount
        animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        layer.addAnimation(animation, forKey: "pop")
    }
    
    func flipX(){
        
        let delay = 0
        let duration = 0.7
        let curve = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0 / layer.frame.size.width/2
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform"
        animation.fromValue = NSValue(CATransform3D:
            CATransform3DMakeRotation(0, 0, 0, 0))
        animation.toValue = NSValue(CATransform3D:
            CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(M_PI), 0, 1, 0)))
        animation.duration = CFTimeInterval(duration)
        animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        animation.timingFunction = getTimingFunction(curve)
        layer.addAnimation(animation, forKey: "3d")
        
    }
    
    func flipY(){
        
        let delay = 0
        let duration = 0.7
        let curve = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0 / layer.frame.size.width/2
        let animation = CABasicAnimation()
        animation.keyPath = "transform"
        animation.fromValue = NSValue(CATransform3D:
            CATransform3DMakeRotation(0, 0, 0, 0))
        animation.toValue = NSValue(CATransform3D:
            CATransform3DConcat(perspective,CATransform3DMakeRotation(CGFloat(M_PI), 1, 0, 0)))
        animation.duration = CFTimeInterval(duration)
        animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        animation.timingFunction = getTimingFunction(curve)
        layer.addAnimation(animation, forKey: "3d")
    }
    func Squeeze(){
        let delay = 0
        let duration = 0.7
        let curve = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let force = 1.0
        let repeatCount = Float(1)
        let morphX = CAKeyframeAnimation()
        morphX.keyPath = "transform.scale.x"
        morphX.values = [1, 1.5*force, 0.5, 1.5*force, 1]
        morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        morphX.timingFunction = getTimingFunction(curve)
        morphX.duration = CFTimeInterval(duration)
        morphX.repeatCount = repeatCount
        morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        layer.addAnimation(morphX, forKey: "morphX")
        
        let morphY = CAKeyframeAnimation()
        morphY.keyPath = "transform.scale.y"
        morphY.values = [1, 0.5, 1, 0.5, 1]
        morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        morphY.timingFunction = getTimingFunction(curve)
        morphY.duration = CFTimeInterval(duration)
        morphY.repeatCount = repeatCount
        morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        layer.addAnimation(morphY, forKey: "morphY")
    }
    func wobble(){
        let delay = 0
        let duration = 0.7
        let curve = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let force = 1.0
        let repeatCount = Float(1)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.rotation"
        animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.duration = CFTimeInterval(duration)
        animation.additive = true
        animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        layer.addAnimation(animation, forKey: "wobble")
        
        let x = CAKeyframeAnimation()
        x.keyPath = "position.x"
        x.values = [0, 30*force, -30*force, 30*force, 0]
        x.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        x.timingFunction = getTimingFunction(curve)
        x.duration = CFTimeInterval(duration)
        x.additive = true
        x.repeatCount = repeatCount
        x.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        layer.addAnimation(x, forKey: "x")
    }
    func swing(){
        let delay = 0
        let duration = 0.7
        let force = 1.0
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.rotation"
        animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.duration = CFTimeInterval(duration)
        animation.additive = true
        animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
        layer.addAnimation(animation, forKey: "swing")
    }
}



