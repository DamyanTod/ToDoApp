//
//  TaskCategoriesInteractor.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

protocol TaskCategoriesInteractorInput {
    func updateCategories(_ editedItems : [String])
    func getCategories() -> [Category]?
}

protocol TaskCategoriesInteractorOutput: class {

}

class TaskCategoriesInteractor: TaskCategoriesInteractorInput {
    
    var output: TaskCategoriesInteractorOutput?
    
    func updateCategories(_ editedItems: [String]) {
        DatabaseManager.shared.updateCategories(categories: editedItems)
    }
    
    func getCategories() -> [Category]? {
        return DatabaseManager.shared.getCategories()
    }
    
}
