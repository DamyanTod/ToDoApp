//
//  TaskCategoriesPresenter.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

protocol TaskCategoriesPresenterInput: class {
    func navigateToPreviousController()
}

class TaskCategoriesPresenter: TaskCategoriesPresenterInput, TaskCategoriesInteractorOutput {
    
    weak var view: TaskCategoriesViewControllerInput?
    
    var interactor: TaskCategoriesInteractorInput
    var router: TaskCategoriesRouterInput
    
    var task:Task?

    required init(with interactor: TaskCategoriesInteractorInput, router: TaskCategoriesRouterInput) {
        
        self.interactor = interactor
        self.router = router
        
    }

}

//MARK: View inputs

extension TaskCategoriesPresenter {
    func navigateToPreviousController() {
        router.navigateToPreviusController()
    }
    
}
