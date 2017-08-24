//
//  DetailTaskView.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

class DetailTaskView : UIView, SubViewProtocol {
    
    @IBOutlet weak var navigationBarContainer: UIView!
    let navigationBar = NavigationBar.fromNib()
    
    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var footerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var footerContainer: UIView!
    var footer = DetailToDoFooter.fromNib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupNavigationBar()
    }

    
    private func setupNavigationBar () {
        navigationBar.addLikeSubViewIn(parent: navigationBarContainer)
        navigationBar.setLeftButton(type: .back)
    }
    
    
    func setupFooter () {
        footerHeightConstraint.constant = DetailToDoFooter.height
        footer.addLikeSubViewIn(parent: footerContainer)
    }
    
    func showDeleteButton () {
        navigationBar.setRightSideRightButton(type: .delete)
    }
    
}
