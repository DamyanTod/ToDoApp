//
//  TaskCategoriesView.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

class TaskCategoriesView: UIView, SubViewProtocol {
    
    @IBOutlet weak var navigationBarContainer: UIView!
    let navigationBar = NavigationBar.fromNib()
    
    @IBOutlet weak var displayTagsLabel: BaseLabel!
    
    @IBOutlet weak var categoriesContainer: UIView!
    var categoriesView:TagView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        navigationBar.addLikeSubViewIn(parent: navigationBarContainer)
        configurateNavigationBar()
    }
    
    func configurateCategoriesView () {
        categoriesView = TagView(position: CGPoint( x: 0, y: 0 ), size: CGSize( width: categoriesContainer.frame.width, height: categoriesContainer.frame.height))
        categoriesContainer.addSubview(categoriesView!)
    }
    
    private func configurateNavigationBar () {
        navigationBar.setLeftButton(type: .back)
        navigationBar.setRightSideRightButton(type: .edit)
    }
    
}

//MARK: Public methods
extension TaskCategoriesView {
    func addTagsViews(categories : [Category], selected: [String]?) {
        
        var selectedItem = false
        for category in categories {
            if let selected = selected {
                for alreadySelectedItem in selected {
                    if category.name == alreadySelectedItem {
                        selectedItem = true
                    }
                }
            }
            categoriesView!.addTag(tagString: category.name, tagId: category.id , isSelected: selectedItem)
            selectedItem = false
        }
    }
}
