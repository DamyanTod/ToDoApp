//
//  TasksPresenter.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

protocol TasksPresenterInput: class {

}

class TasksPresenter: TasksPresenterInput, TasksInteractorOutput {
    
    weak var view: TasksViewControllerInput?
    
    var interactor: TasksInteractorInput
    var router: TasksRouterInput

    required init(with interactor: TasksInteractorInput, router: TasksRouterInput) {
        
        self.interactor = interactor
        self.router = router
        
    }

}
