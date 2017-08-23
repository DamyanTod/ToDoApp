//
//  BaseLabel.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

class BaseLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let size:CGFloat = CGFloat.setRightFontSize(value: self.font.pointSize)
        self.font = UIFont.defaultFontFamily(fontSize: size)
    }
    
}
