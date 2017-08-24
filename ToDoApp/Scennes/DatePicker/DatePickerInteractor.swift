//
//  DatePickerInteractor.swift
//  ToDoApp
//
//  Created by El Capitan on 8/24/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import Foundation

protocol DatePickerInteractorInput {
    func updateTask(task : Task)
}

protocol DatePickerInteractorOutput: class {
    
}

class DatePickerInteractor: DatePickerInteractorInput {
    
    var output: DatePickerInteractorOutput?

    func updateTask(task: Task) {
        
    }
    
}
