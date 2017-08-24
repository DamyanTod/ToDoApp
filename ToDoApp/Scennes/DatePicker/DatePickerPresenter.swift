//
//  DatePickerPresenter.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

protocol DatePickerPresenterInput: class {
    func navigateToPreviousController()
    func updateTask(date : NSDate)
}

class DatePickerPresenter: DatePickerPresenterInput,DatePickerInteractorOutput {
    
    weak var view: DatePickerViewControllerInput?
    
    var interactor: DatePickerInteractorInput
    var router: DatePickerRouterInput
    
    var task: Task? {
        didSet {
            if let task = task {
                view?.populateView(task : task)
            }
        }
    }

    required init(with interactor: DatePickerInteractorInput,router: DatePickerRouterInput) {
        self.router = router
        self.interactor = interactor
    }

}

//MARK: View Inputs
extension DatePickerPresenter {
    func navigateToPreviousController() {
        router.navigateToPreviousController()
    }
    
    func updateTask(date: NSDate) {
        if let task = task {
            task.completionDate = date
        }
    }
}
