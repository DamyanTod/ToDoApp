//
//  DetailTaskPresenter.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

protocol DetailTaskPresenterInput: class {
    func backButtonPressed()
}

class DetailTaskPresenter: DetailTaskPresenterInput, DetailTaskInteractorOutput {
    
    weak var view: DetailTaskViewControllerInput?
    
    var interactor: DetailTaskInteractorInput
    var router: DetailTaskRouterInput
    
    var task: Task? {
        didSet {
            if let task = task {
                view?.populateViews(task: task)
            }
        }
    }

    required init(with interactor: DetailTaskInteractorInput, router: DetailTaskRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    

}

//MARK: View inputs
extension DetailTaskPresenter {
    func backButtonPressed() {
        router.navigateToPreviousController()
    }
}