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
        let presenter = DatePickerPresenter(router: router)
        presenter.view = viewController
        
        router.viewController = viewController
        viewController.presenter = presenter
    }
}
