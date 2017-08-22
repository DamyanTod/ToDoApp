//
//  TasksPresenter.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation

protocol TasksPresenterInput: class {
    
    func populateCell(cell: TasksCellProtocol, indexPath : IndexPath)

}

class TasksPresenter: TasksPresenterInput, TasksInteractorOutput {
    
    weak var view: TasksViewControllerInput?
    
    var interactor: TasksInteractorInput
    var router: TasksRouterInput
    
    var tasks:[Task]? {
        didSet {
            if let tasks = tasks,
                tasks.count != 0 {
                    view?.reloadTableView()
            } else {
                view?.jitterAddButton()
            }
        }
    }
    
    fileprivate let dateFormatter = DateFormatter()

    required init(with interactor: TasksInteractorInput, router: TasksRouterInput) {
        
        self.interactor = interactor
        self.router = router
        
        let task1 = Task(title: "task1", category: "job", categoryColor: HexColors.defaultDarkGreenColor, completionDate: Date(), isDone: false)
        let task2 = Task(title: "task2", category: "school", categoryColor: HexColors.defaultRedColor, completionDate: Date(), isDone: false)
        let task3 = Task(title: "task3", category: "home", categoryColor: HexColors.defaultDarkGreenColor, completionDate: Date(), isDone: false)
        let task4 = Task(title: "task4", category: "car", categoryColor: HexColors.defaultDarkOrangenColor, completionDate: Date(), isDone: false)
        let task5 = Task(title: "task5", category: "family", categoryColor: HexColors.defaultLightOrangeColor, completionDate: Date(), isDone: false)
        let task6 = Task(title: "task6", category: "homework", categoryColor: HexColors.lightPinkColor, completionDate: Date(), isDone: true)
        
        tasks = [task1,task2,task3,task4,task5,task6]

        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "en_US")
        
    }

}

//MARK: View Input
extension TasksPresenter {
    func populateCell(cell: TasksCellProtocol, indexPath: IndexPath) {
        
        if let tasks = tasks {
            cell.setDate(date: dateFormatter.string(from: tasks[indexPath.row].completionDate))
            cell.setTitle(title: tasks[indexPath.row].title)
            cell.setColor(color: tasks[indexPath.row].categoryColor)
            cell.setCategory(category: tasks[indexPath.row].category)
            
            cell.displayBottomLine(isNeeded: indexPath.row != tasks.count - 1)
            cell.displayUpperLine(isNeeded: indexPath.row != 0)
            cell.displayItem(state: tasks[indexPath.row].isDone ? .filled : .clock)

        }

    }
    

}



