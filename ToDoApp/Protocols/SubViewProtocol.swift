//
//  SubViewProtocol.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

protocol SubViewProtocol {
    
}

extension SubViewProtocol where Self: UIView {
    
    func addLikeSubViewIn(parent : UIView) {
        self.frame = CGRect(x: 0, y: 0, width: parent.frame.size.width, height: parent.frame.size.height)
        parent.addSubview(self)
    }
    
}
