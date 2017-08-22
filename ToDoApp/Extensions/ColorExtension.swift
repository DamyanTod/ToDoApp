//
//  ColorExtension.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

struct HexColors {
    
    static let defaultLightGreenColor = "#C6DA02"
    static let defaultDarkGreenColor = "#79A700"
    static let defaultDarkOrangenColor = "#F68B2C"
    static let defaultLightOrangeColor = "#E2B400"
    static let defaultRedColor = "#F5522D"
    static let lightPinkColor = "#FF6E83"
}

extension UIColor {
    
    static func colorWithHexString (hex:String) -> UIColor {

        let start = hex.index(hex.startIndex, offsetBy: 1)
        let hexColor = hex.substring(from: start)
        
        if (hexColor.characters.count != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: hexColor).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }


 
}
