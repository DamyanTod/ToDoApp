//
//  Task.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation

extension Task {
    func getCategoriesAsArray () -> [String]? {
        if let categories = categories,
            categories != "" {
            return categories.components(separatedBy: ", ")
        }
        return nil
    }
}

class TaskRequest {
    
    var title: String
    var categories: String
    var categoryColor: String
    var completionDate: NSDate
    var isDone : Bool
    
    init(title : String, categories : String , categoryColor: String , completionDate : NSDate, isDone : Bool) {
        self.title = title
        self.categories = categories
        self.categoryColor = categoryColor
        self.completionDate = completionDate
        self.isDone = isDone
    }
    
    func getCategoriesAsArray () -> [String]? {
        if categories != "" {
            return categories.components(separatedBy: ", ")
        }
        return nil
    }
}
