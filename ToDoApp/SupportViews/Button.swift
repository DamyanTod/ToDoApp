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
    case settings
    case add
    
}

class Button: UIButton, ViewAnimationProtocol  {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel?.font = UIFont.defaultFontFamily(fontSize: self.titleLabel!.font.pointSize)
        
    }
    
    func setButtonAppearance (type : ButtonType) {
        
        switch type {
            
        case .add:
            addImage("add_icon", color: UIColor.black)

        case .settings:
            addImage("settings_icon", color: UIColor.black)

        case .delete:
            addImage("delete_icon", color: UIColor.black)

        case .back:
            addImage("back_icon", color: UIColor.black)
        }
    }
    
    private func addImage (_ imageName : String , color : UIColor) {
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        self.setImage(image, for: UIControlState.normal)
        self.imageView?.tintColor = color
    }
    
    
    
}
