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
        self.frame = parent.frame
        parent.addSubview(self)
    }
    
}
