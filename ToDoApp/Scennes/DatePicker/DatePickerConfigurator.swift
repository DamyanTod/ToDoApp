//
//  DatePickerConfigurator.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

// MARK: - Configuration

class DatePickerConfigurator {
    
    class func configure(viewController: DatePickerViewController) {
        
        let router = DatePickerRouter()
        let interactor = DatePickerInteractor()
        let presenter = DatePickerPresenter(with: interactor, router: router)
        presenter.view = viewController
        
        interactor.output = presenter
        router.viewController = viewController
        viewController.presenter = presenter
    }
}
