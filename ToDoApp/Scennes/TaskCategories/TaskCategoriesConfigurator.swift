//
//  TaskCategoriesConfigurator.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

// MARK: - Configuration

class TaskCategoriesConfigurator {
    
    class func configure(viewController: TaskCategoriesViewController) {
        
        let router = TaskCategoriesRouter()
        let interactor = TaskCategoriesInteractor()
        let presenter = TaskCategoriesPresenter(with: interactor, router: router)
        presenter.view = viewController
        
        interactor.output = presenter
        router.viewController = viewController
        viewController.presenter = presenter
    }
}
