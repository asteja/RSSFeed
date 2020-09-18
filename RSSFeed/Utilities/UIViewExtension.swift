//
//  UIViewExtension.swift
//  RSSFeed
//
//  Created by Saiteja Alle on 9/17/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import UIKit

extension UIView {
 
    func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, horizontal:NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
        
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
 
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
        }
 
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
    
        if let top = top {
            constraints.append(self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset))
        }
        if let left = left {
            constraints.append(self.leftAnchor.constraint(equalTo: left, constant: paddingLeft))
        }
        if let right = right {
            constraints.append(self.rightAnchor.constraint(equalTo: right, constant: -paddingRight))
        }
        if let bottom = bottom {
            constraints.append(self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset))
        }
        if height != 0 {
            constraints.append(self.heightAnchor.constraint(equalToConstant: height))
        }
        if width != 0 {
            constraints.append(self.widthAnchor.constraint(equalToConstant: width))
        }
        if let horizontal = horizontal {
            constraints.append(self.centerXAnchor.constraint(equalTo: horizontal))
        }
        
        NSLayoutConstraint.activate(constraints)
 
    }
 
}
