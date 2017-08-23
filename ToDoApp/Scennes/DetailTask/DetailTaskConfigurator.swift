//
//  DetailTaskConfigurator.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

// MARK: - Configuration

class DetailTaskConfigurator {
    
    class func configure(viewController: DetailTaskViewController) {
        
        let router = DetailTaskRouter()
        let interactor = DetailTaskInteractor()
        let presenter = DetailTaskPresenter(with: interactor, router: router)
        presenter.view = viewController
        
        interactor.output = presenter
        router.viewController = viewController
        viewController.presenter = presenter
    }
}
