//
//  DatabaseManager.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation

/*
 Task and Category does not have relationship because at one moment we can change the Category and the Task will be with not existing Category references, (maybe not the best but ..) solution is just to concatinate all names of the Category (job, home, ...) and we keep them like string
 
 When we turn the app with simulator and we change some values everything is ok but when we terminate the simulator with stop the actual changes on updated models are not saved. My iPhone is on iOS 11 beta and I cant test it right now :(. Maybe there is a issue there, but I think that this Simulator is the main reason.
 */

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private init () {}
    
    let dbContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func tryToSaveContext() {
        do {
            try dbContext.save()
        } catch {
            print(error)
        }
    }
    
}

//MARK: Tasks
extension DatabaseManager {
    
    //MARK: Public
    
    func addTask (request : TaskRequest) -> Task {
        
        let task = Task(entity: Task.entity(), insertInto: dbContext)
        task.id = incrementID()
        task.color = request.categoryColor
        task.completionDate = request.completionDate as NSDate?
        task.isDone = request.isDone
        task.title = request.title
        task.categories = request.categories
        
        tryToSaveContext()
        
        return task
    }
    
    func removeTask (task : Task) {
        dbContext.delete(task)
        tryToSaveContext()
    }
    
    func getTasks () -> [Task]? {
        var result:[Task]?
        do {
            result = try dbContext.fetch(Task.fetchRequest())
        } catch {
            print(error)
        }
        return result
    }
    
    //MARK: Private 
    
    private func insertTask (request : Task) {
        let task = Task(entity: Task.entity(), insertInto: dbContext)
        task.id = request.id
        task.color = request.color
        task.completionDate = request.completionDate
        task.isDone = request.isDone
        task.title = request.title
        task.categories = request.categories
        
        tryToSaveContext()
    }
    
    ///at this point we dont use the id but if we need some kind of uniquenest we have it
    private func incrementID () -> Int64 {
        guard let tasks = getTasks() else {
            return 0
        }
        return tasks.map{$0.id}.max()! + 1
    }

}

//MARK: Categories
extension DatabaseManager {
    
    //MARK: Public
    
    func addCategory (request : CategoryRequest) {
        
        let category = Category(entity: Category.entity(), insertInto: dbContext)
        category.name = request.name
        
        tryToSaveContext()
    }
    
    func removeCategory (category: Category) {
        dbContext.delete(category)
        tryToSaveContext()
    }
    
    func updateCategories(categories : [String]) {
        removeCategories()
        for category in categories {
            //id is not used for now
            let request = CategoryRequest(name: category, id: 0)
            addCategory(request: request)
        }
    }
    
    func getCategories () -> [Category]? {
        
        var result:[Category]?
        
        result = getCategoriesIfPossible()
        
        if result?.count == 0 {
            insertCategories()
            result = getCategoriesIfPossible()
        }
        
        return result
    }
    

    //MARK: Private
    
    private func removeCategories () {
        
        if let categories = getCategories() {
            for category in categories {
                dbContext.delete(category)
            }
            
            tryToSaveContext()
        }
    }
    
    ///first time when we run the app there is no categories and we need to insert them
    private func getCategoriesIfPossible () -> [Category]? {
        var result:[Category]?
        do {
            result = try dbContext.fetch(Category.fetchRequest())
        } catch {
            print(error)
        }
        return result
    }
    
    private func insertCategories () {
        let stringCategories = Category.getCategoriesLikeStringIfNeeded()
        
        var result = [Category]()
        
        for name in stringCategories {
            let category = Category(entity: Category.entity(), insertInto: dbContext)
            category.name = name
            result.append(category)
        }
        
        tryToSaveContext()
    }
}
