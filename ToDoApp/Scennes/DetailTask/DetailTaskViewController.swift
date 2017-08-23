//
//  DetailTaskViewController.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

protocol DetailTaskViewControllerInput: class {
    func populateViews(task: Task)
}

class DetailTaskViewController: UIViewController, DetailTaskViewControllerInput {
    
    var presenter: DetailTaskPresenter!
    
    fileprivate var contentView = DetailTaskView.fromNib()
    
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
        DetailTaskConfigurator.configure(viewController: self)
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.addLikeSubViewIn(parent: self.view)
        addTargets()
        showDeleteButtonIfNeeded()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contentView.setupFooter()
    }
    
    private func addTargets () {
        contentView.navigationBar.leftSideLeftButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
    }
    
    private func showDeleteButtonIfNeeded() {
        if presenter.task != nil {
            contentView.showDeleteButton()
            contentView.navigationBar.rightSideRightButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        }
    }
    
}

//MARK: Public methods
extension DetailTaskViewController {
    func populateViews(task: Task) {
        contentView.titleTextField.text = task.title
        contentView.footer.tagsBtn.setTitle(task.categories, for: .normal)
        contentView.footer.timeBtn.setTitle(task.completionDate.getUserLocalDate(), for: .normal)
        contentView.footer.indicatorColorView.backgroundColor = UIColor.colorWithHexString(hex: task.categoryColor)
    }
}


//MARK: @IBActions
extension DetailTaskViewController {
    @IBAction func backButtonPressed (sender: UIButton) {
        presenter.backButtonPressed()
    }
    
    @IBAction func deleteButtonPressed (sender: UIButton) {
        //TODO: CoreDate implementation
    }
    
}







