//
//  UIView.swift
//  Masar
//
//  Created by Sarah Gamal on 7/8/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import UIKit


extension UIView {
    
    func round(radius: CGFloat, maskToBounds: Bool = false, clipsToBounds: Bool = false) {
        layer.cornerRadius = radius
        layer.masksToBounds = maskToBounds
        self.clipsToBounds = clipsToBounds
    }
    
    func round(radius : CGFloat,cornersToRound : CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = cornersToRound
    }
    
    func round(radius : CGFloat, cornersToRound : UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: cornersToRound, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
        layer.masksToBounds = true
        self.clipsToBounds = true        
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 1
    }
    
}
