//
//  DatePickerViewController.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

protocol DatePickerViewControllerInput: class {
    func populateView(task : Task)
}

class DatePickerViewController: UIViewController, DatePickerViewControllerInput {
    
    var presenter: DatePickerPresenter!
    
    fileprivate var contentView = DatePickerView.fromNib()
    
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
        DatePickerConfigurator.configure(viewController: self)
    }
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.addLikeSubViewIn(parent: self.view)
        addTargets()
    }
    
    private func addTargets () {
        contentView.datePicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        contentView.navigationBar.leftSideLeftButton.addTarget(self, action: #selector(backButtonPressed), for: .touchDown)
    }
    

}

//MARK: Public methods
extension DatePickerViewController {
    func populateView(task: Task) {
        contentView.startsDateLabel.text = task.completionDate?.getUserLocalDate()
    }
}

//MARK: @IBActions
extension DatePickerViewController {
    
    @IBAction func backButtonPressed (sender: UIButton) {
        presenter.navigateToPreviousController()
    }
    
    @IBAction func datePickerChanged (sender: UIDatePicker) {
        if let date = sender.date as NSDate? {
            presenter?.updateTask(date: date)
            contentView.startsDateLabel.text = date.getUserLocalDate()
        }
        
    }
    
}











