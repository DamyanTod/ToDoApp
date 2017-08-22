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
        self.backgroundColor = UIColor.white
        titleLabel.textColor = UIColor.white
        
    }
    
    func setLeftButtonToBackButton() {
        leftSideLeftButton.isHidden = false
        leftSideLeftButton.setFRTButtonAppearance(type: .back)
    }

    
    
}
