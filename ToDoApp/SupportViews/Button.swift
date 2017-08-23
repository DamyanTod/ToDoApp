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
    case positiveAnswerButton
    
}

class Button: UIButton, ViewAnimationProtocol  {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel?.font = UIFont.defaultFontFamily(fontSize: self.titleLabel!.font.pointSize)
        
    }
    
    func setButtonAppearance (type : ButtonType, text : String?) {
        
        let title = text ?? ""
        
        self.setTitle(title, for: .normal)
        
        switch type {
            
        case .add:
            addImage("add_icon", color: UIColor.black)

        case .settings:
            addImage("settings_icon", color: UIColor.black)

        case .delete:
            addImage("delete_icon", color: UIColor.black)

        case .back:
            addImage("back_icon", color: UIColor.black)
            
        case .positiveAnswerButton:
            self.setTitleColor(UIColor.black, for: .normal)
            self.backgroundColor = UIColor.colorWithHexString(hex: HexColors.defaultLightGreenColor)
            self.layer.cornerRadius = self.frame.height/2
            self.clipsToBounds = true
        }
    }
    
    private func addImage (_ imageName : String , color : UIColor) {
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        self.setImage(image, for: UIControlState.normal)
        self.imageView?.tintColor = color
    }
    
    
    
}
