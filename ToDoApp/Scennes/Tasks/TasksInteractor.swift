//
//  TasksInteractor.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

protocol TasksInteractorInput {
    func getTasks() -> [Task]?
    func removeTask(_ task : Task)
}

protocol TasksInteractorOutput: class {

}

class TasksInteractor: TasksInteractorInput {
    
    var output: TasksInteractorOutput?
    
    func getTasks() -> [Task]? {
        return DatabaseManager.shared.getTasks()
    }
    func removeTask(_ task: Task) {
        DatabaseManager.shared.removeTask(task: task)
    }
}
