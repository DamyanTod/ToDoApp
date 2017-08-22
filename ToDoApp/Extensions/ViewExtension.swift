//
//  ViewExtension.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    class func instanceFromNib(nibName: String) -> UIView {
        return UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    func addShadowToView () {
        
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        self.layer.cornerRadius = 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)  //Here you control x and y
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5.0 //Here your control your blur
        self.layer.masksToBounds =  false
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    func cutTheView(rect: CGRect) {
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x:0,y:rect.height))
        path.addLine(to: CGPoint(x:0,y:0))
        path.addLine(to: CGPoint(x:rect.width,y:0))
        path.addLine(to: CGPoint(x:rect.width, y:rect.height / 1.3))
        path.stroke()
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect;
        maskLayer.path = path.cgPath;
        
        self.layer.mask = maskLayer;
    }
    
    func addBottomLine (borderHeight : CGFloat) {
        let bottomBorder = CALayer()
        bottomBorder.backgroundColor = UIColor.black.cgColor
        bottomBorder.frame = CGRect(x: 0, y: self.frame.height+3, width: self.frame.width, height: borderHeight)
        self.layer.addSublayer(bottomBorder)
    }
    
    func addUpperLine (borderHeight : CGFloat) {
        let UpperLine = CALayer()
        UpperLine.backgroundColor = UIColor.black.cgColor
        UpperLine.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: borderHeight)
        self.layer.addSublayer(UpperLine)
    }
    
    class func fromNib(nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil: nibNameOrNil, type: self)
    }
    
    class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = fromNib(nibNameOrNil:nibNameOrNil, type: T.self)
        return v!
    }
    
    class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            // Most nibs are demangled by practice, if not, just declare string explicitly
            name = nibName
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews! {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
    class var nibName: String {
        let name = "\(self)".components(separatedBy:".").first ?? ""
        return name
    }
    
    class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
    
}
