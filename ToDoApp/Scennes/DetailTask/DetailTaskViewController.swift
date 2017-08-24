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
    func taskColorUpdated(color : String?)
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
        addDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let task = presenter.task {
            populateViews(task: task)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contentView.setupFooter()
    }
    
    private func addDelegates() {
        contentView.titleTextField.delegate = self
    }
    
    private func addTargets () {
        contentView.navigationBar.leftSideLeftButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        contentView.footer.timeBtn.addTarget(self, action: #selector(timeButtonPressed), for: .touchUpInside)
        for button in contentView.footer.colorButtons {
            button.addTarget(self, action: #selector(colorButtonPressed), for: .touchDown)
        }
        contentView.footer.categoriesBtn.addTarget(self, action: #selector(categoriesButtonPressed), for: .touchUpInside)
    }
    
    fileprivate func showDeleteButtonIfNeeded() {
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
        contentView.footer.categoriesBtn.setTitle(task.categories, for: .normal)
        contentView.footer.timeBtn.setTitle(task.completionDate?.getUserLocalDate(), for: .normal)
        contentView.footer.indicatorColorView.backgroundColor = UIColor.colorWithHexString(hex: task.color)
        showDeleteButtonIfNeeded()
    }
    
    func taskColorUpdated (color : String?) {
        contentView.footer.indicatorColorView.backgroundColor = UIColor.colorWithHexString(hex: color)
    }
}


//MARK: @IBActions
extension DetailTaskViewController {
    @IBAction func backButtonPressed (sender: UIButton) {
        presenter.backButtonPressed()
    }
    
    @IBAction func deleteButtonPressed (sender: UIButton) {
        presenter.deletePressed()
    }
    
    @IBAction func timeButtonPressed (sender: UIButton) {
        presenter.navigateToDatePicker()
    }
    
    @IBAction func categoriesButtonPressed (sender: UIButton) {
        presenter.navigateToCategories()
    }
    
    @IBAction func colorButtonPressed (sender: UIButton) {
        presenter.updateTask(color : contentView.footer.colors[sender.tag])
    }

}

//MARK: Textfield delegates
extension DetailTaskViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        presenter.updateTask(title : textField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}







