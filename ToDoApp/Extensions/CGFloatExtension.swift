//
//  CGFloatExtension.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import UIKit

extension CGFloat {
    
    static func setRightFontSize (value : CGFloat) -> CGFloat {
        
        var result: CGFloat = value

        if DeviceType.IS_IPHONE_5 {
            result = value * 0.9
        }
        if DeviceType.IS_IPHONE_PLUS {
            result = value * 1.1
        }
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            result = value * 1.4
        }
        
        return result
    }
}
