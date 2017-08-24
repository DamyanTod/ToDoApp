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
    func navigateToDatePicker()
    func navigateToCategories()
    func deletePressed()
    func updateTask(color : String)
    func updateTask(title : String)
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
    
    var taskRequest:TaskRequest? = TaskRequest(title: "", categories: "", categoryColor: HexColors.defaultDarkGreenColor, completionDate: NSDate(), isDone: false)

    required init(with interactor: DetailTaskInteractorInput, router: DetailTaskRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
}

//MARK: Interactor Output 
extension DetailTaskPresenter {
    func taskDeleted() {
        router.navigateToPreviousController()
    }
    func taskUpdated() {
        view?.taskColorUpdated(color: task?.color)
    }
    func presentNewTask(task: Task) {
        self.task = task
    }
}

//MARK: View inputs
extension DetailTaskPresenter {
    func backButtonPressed() {
        router.navigateToPreviousController()
    }
    
    func navigateToDatePicker() {
        createTask()
        router.navigateToDatePicker(task)
    }
    
    func navigateToCategories() {
        createTask()
        router.navigateToCategories(task)
    }
    
    fileprivate func createTask() {
        if let taskRequest = taskRequest,
            task == nil {
            interactor.createTask(taskRequest)
            self.taskRequest = nil
        }
    }
    func deletePressed() {
        guard let task = task else {
            router.navigateToPreviousController()
            return
        }
        interactor.deleteTask(task)
        router.navigateToPreviousController()
    }
    
    func updateTask(color: String) {
        guard let task = task else {
            taskRequest?.categoryColor = color
            createTask()
            return
        }
        task.color = color
        view?.populateViews(task: task)
    }
    
    func updateTask(title: String) {
        guard let task = task else {
            taskRequest?.title = title
            createTask()
            return
        }
        task.title = title
    }
}
