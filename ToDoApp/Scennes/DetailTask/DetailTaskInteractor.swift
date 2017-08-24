//
//  DetailTaskInteractor.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

protocol DetailTaskInteractorInput {
    func deleteTask(_ task: Task)
    func createTask(_ task: TaskRequest)
}

protocol DetailTaskInteractorOutput: class {
    func taskDeleted()
    func presentNewTask(task : Task)
}

class DetailTaskInteractor: DetailTaskInteractorInput {
    
    var output: DetailTaskInteractorOutput?
    
    func deleteTask(_ task: Task) {
        DatabaseManager.shared.removeTask(task: task)
        output?.taskDeleted()
    }
    
    func createTask(_ task: TaskRequest) {
        output?.presentNewTask(task: DatabaseManager.shared.addTask(request: task))
    }
    
}
