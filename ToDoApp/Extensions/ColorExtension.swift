//
//  ColorExtension.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = hexString.substring(from: start)
            
            if hexColor.characters.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
  
    
    static func defaultLightGreenColor () -> UIColor {
        return UIColor(hexString: "#C6DA02")!
    }
    
    static func defaultDarkGreenColor () -> UIColor {
        return UIColor(hexString: "#79A700")!
    }
    
    static func defaultDarkOrangenColor () -> UIColor {
        return UIColor(hexString: "#F68B2C")!
    }
    
    static func defaultLightOrangeColor () -> UIColor {
        return UIColor(hexString: "#E2B400")!
    }
    
    static func defaultRedColor () -> UIColor {
        return UIColor(hexString: "#F5522D")!
    }
    
    static func defaultPinkColor () -> UIColor {
        return UIColor(hexString: "#FF6E83")!
    }
    
}
