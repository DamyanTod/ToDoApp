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
}

class DatePickerPresenter: DatePickerPresenterInput {
    
    weak var view: DatePickerViewControllerInput?
    
    var router: DatePickerRouterInput
    
    var task: Task? {
        didSet {
            if let task = task {
                view?.populateView(task : task)
            }
        }
    }

    required init(router: DatePickerRouterInput) {
        self.router = router
        
    }

}

//MARK: View Inputs
extension DatePickerPresenter {
    func navigateToPreviousController() {
        router.navigateToPreviousController()
    }
}
