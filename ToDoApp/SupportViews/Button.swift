//
//  Button.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit


import UIKit

enum ButtonType {

    case delete
    case back
}

class Button: UIButton  {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel?.font = UIFont.defaultFontFamily(fontSize: self.titleLabel!.font.pointSize)
        
    }
    
    func setFRTButtonAppearance (type : ButtonType) {
        
        switch type {
            
        case .delete:
            
            let image = UIImage(named: "delete_icon")?.withRenderingMode(.alwaysTemplate)
            self.setImage(image, for: .normal)
            self.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7)
            self.tintColor = UIColor.white

        case .back:
            
            let image = UIImage(named: "back_icon")?.withRenderingMode(.alwaysTemplate)
            self.setImage(image, for: UIControlState.normal)
            self.imageView?.tintColor = UIColor.white
            
        }
    }
    
    
    
}
