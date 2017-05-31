//
//  extensions.swift
//  BottomSheet
//
//  Created by Joakim Nereng Ellestad on 31.05.2017.
//  Copyright © 2017 Joakim Nereng Ellestad. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func roundcorners(withCorners: UIRectCorner, withRadius: CGFloat){
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: withCorners, cornerRadii: CGSize(width: withRadius, height: withRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func addBlurToView(withEffect: UIBlurEffectStyle){
        
        let blurEffect = UIBlurEffect(style:withEffect)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = frame
        blurEffectView.clipsToBounds = true
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
        //frame.sendSubview(toBack: blurEffectView)
    }
    
}
