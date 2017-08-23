//
//  Task.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation

class Task {
    
    var title: String
    var categories: String
    var categoryColor: String
    var completionDate: Date
    var isDone : Bool
    
    init(title : String, categories : String , categoryColor: String , completionDate : Date, isDone : Bool) {
        self.title = title
        self.categories = categories
        self.categoryColor = categoryColor
        self.completionDate = completionDate
        self.isDone = isDone
    }
    
}
