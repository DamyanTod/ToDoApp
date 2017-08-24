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
    func updateCategories(_ editedItems : [String])
    func updateTask(categories: String)
}

class TaskCategoriesPresenter: TaskCategoriesPresenterInput, TaskCategoriesInteractorOutput {
    
    weak var view: TaskCategoriesViewControllerInput?
    
    var interactor: TaskCategoriesInteractorInput
    var router: TaskCategoriesRouterInput
    
    var task:Task?
    
    var categories:[Category]? {
        return interactor.getCategories()
    }

    required init(with interactor: TaskCategoriesInteractorInput, router: TaskCategoriesRouterInput) {
        self.interactor = interactor
        self.router = router
    }

}
//MARK: Interactor response 
extension TaskCategoriesPresenter {
    
}

//MARK: View inputs

extension TaskCategoriesPresenter {
    func navigateToPreviousController() {
        router.navigateToPreviusController()
    }
    
    func updateCategories(_ editedItems: [String]) {
        interactor.updateCategories(editedItems)
    }
    
    func updateTask(categories: String) {
        guard let task = task else {
            return
        }
        task.categories = categories
    }
    
}
