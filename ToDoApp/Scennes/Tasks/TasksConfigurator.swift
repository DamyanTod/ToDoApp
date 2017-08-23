//
//  TasksConfigurator.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

// MARK: - Configuration

class TasksConfigurator {
    
    class func configure(viewController: TasksViewController) {
        
        let router = TasksRouter()
        let interactor = TasksInteractor()
        let presenter = TasksPresenter(with: interactor, router: router)
        presenter.view = viewController
        
        interactor.output = presenter
        router.viewController = viewController
        viewController.presenter = presenter
    }
}
