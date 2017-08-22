//
//  NavigationBar.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

class NavigationBar: UIView, SubViewProtocol {
    
    @IBOutlet weak var leftSideLeftButton: Button!
    
    @IBOutlet weak var rightSideRightButton: Button!
    @IBOutlet weak var rightSideLeftButton: Button!
    
    @IBOutlet weak var titleLabel: BaseLabel!
    @IBOutlet weak var topNavigationBarBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        leftSideLeftButton.isHidden = true
        rightSideRightButton.isHidden = true
        rightSideLeftButton.isHidden = true
        self.backgroundColor = UIColor.colorWithHexString(hex: HexColors.defaultLightGreenColor)
        topNavigationBarBackgroundView.backgroundColor = UIColor.clear

        
    }
    
    func setLeftButton(type : ButtonType) {
        leftSideLeftButton.isHidden = false
        leftSideLeftButton.setButtonAppearance(type: type)
    }
    
    func setRightSideRightButton (type : ButtonType) {
        rightSideRightButton.isHidden = false
        rightSideRightButton.setButtonAppearance(type: type)
    }
    
    func setRightSideLeftButton (type: ButtonType) {
        rightSideLeftButton.isHidden = false
        rightSideLeftButton.setButtonAppearance(type: type)
    }

    
    
}
