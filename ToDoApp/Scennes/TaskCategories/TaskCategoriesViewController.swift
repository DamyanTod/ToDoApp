//
//  TaskCategoriesViewController.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

protocol TaskCategoriesViewControllerInput: class {
    
}

class TaskCategoriesViewController: UIViewController, TaskCategoriesViewControllerInput {
    
    var presenter: TaskCategoriesPresenter!
    
    fileprivate var contentView = TaskCategoriesView.fromNib()
    
    // MARK: - Object lifecycle
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Do not ask for presenter before this call
        self.setupVIPER()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Do not ask for presenter before this call
        self.setupVIPER()
    }

    // MARK: - Initilization
    func setupVIPER() {
        TaskCategoriesConfigurator.configure(viewController: self)
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.addLikeSubViewIn(parent: self.view)
        setupLabelData()
        addTargets()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contentView.configurateCategoriesView()
        setDelegates()
        if let categories = presenter.categories {
            displayTags(categories)
        }
    }
    
    private func addTargets() {
        contentView.navigationBar.leftSideLeftButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        contentView.navigationBar.rightSideRightButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
    }
    
    private func setDelegates() {
        contentView.categoriesView?.delegate = self
    }

    private func setupLabelData () {
        contentView.displayTagsLabel.text = presenter.task?.categories
    }

}

//MARK: Public methods 
extension TaskCategoriesViewController {
    func displayTags(_ categories: [Category]) {
        contentView.addTagsViews(categories: categories, selected: presenter.task?.getCategoriesAsArray())
    }
}

//MARK: @IBActions
extension TaskCategoriesViewController {
    
    @IBAction func backButtonPressed (sender : UIButton) {
        presenter.navigateToPreviousController()
    }
    
    @IBAction func editButtonPressed (sender : UIButton) {
        contentView.categoriesView?.enableEdit = (contentView.categoriesView?.enableEdit)! ? false : true
        if (contentView.categoriesView?.enableEdit)! {
            contentView.categoriesView?.onTapAddButton(sender: (contentView.categoriesView?._addButton)!)
        }
    }
    
    
}

//MARK: TagViewDelegate
extension TaskCategoriesViewController: TagViewDelegate {
    
    func onDidEndEditingTag(sender: UIView) {
        contentView.categoriesView?.enableEdit = contentView.categoriesView!.enableEdit ? false : true
    }
    
    func getTagValuesAfterEdit(editedItems: [String]) {
        presenter.updateCategories(editedItems)
    }
    
    func itemPressed(pressedItems: [String]) {
        let pressedItems = pressedItems.map({ $0 }).joined(separator: ", ")
        contentView.displayTagsLabel.text = pressedItems
        presenter.updateTask(categories: pressedItems)
    }
    
}









