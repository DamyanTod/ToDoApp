//
//  FontExtension.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    static func defaultFontFamily (fontSize : CGFloat) -> UIFont {
        return UIFont (name: "Helvetica" , size: fontSize)!
    }

}
