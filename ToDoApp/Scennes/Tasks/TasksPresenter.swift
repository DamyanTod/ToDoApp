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
    func filterTasks(value : SegmentStatus)
    func removeItem(_ index: Int)
    func changeTaskStateToDone(_ index : Int)
}

class TasksPresenter: TasksPresenterInput, TasksInteractorOutput {
    
    weak var view: TasksViewControllerInput?
    
    var interactor: TasksInteractorInput
    var router: TasksRouterInput
    
    var tasks:[Task]? {
        didSet {
            performActionAfterChangedTasks(tasks: tasks)
        }
    }

    fileprivate var archivedTasks:[Task]?
    
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
        archivedTasks = tasks

        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "en_US")
        
    }
    
    fileprivate func performActionAfterChangedTasks (tasks : [Task]?) {
        if let tasks = tasks,
            tasks.count != 0 {
            view?.reloadTableView()
        } else {
            view?.reloadTableView()
            view?.jitterAddButton()
        }
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
    
    func filterTasks(value: SegmentStatus) {
        //TODO: need to take the tasks with query from CoreData
        switch value {
        case .available:
            if tasks != nil {
                self.tasks = archivedTasks!.filter({ $0.isDone == false })
            }
        case .completed:
            if tasks != nil {
                self.tasks = archivedTasks!.filter({ $0.isDone == true })
            }
        }
    }
    
    func removeItem(_ index: Int) {
        //TODO: need to take the tasks with query from CoreData
        //There is bug right now here need to be handled with CoreData
        var result:Int?
        var i = 0
        if let item = tasks?[index] {
            for archivedItem in archivedTasks! {
                if item.title == archivedItem.title {
                    result = i
                    break
                }
                i += 1
            }
        }
        guard let archivedIndex = result else {
            return
        }
        
        archivedTasks?.remove(at: archivedIndex)
        tasks?.remove(at: index)
        performActionAfterChangedTasks(tasks: tasks)
    }
    
    func changeTaskStateToDone(_ index: Int) {
        //TODO: need to take the tasks with query from CoreData
        //There is bug right now here need to be handled with CoreData
        var result:Int?
        var i = 0
        if let item = tasks?[index] {
            for archivedItem in archivedTasks! {
                if item.title == archivedItem.title {
                    result = i
                    break
                }
                i += 1
            }
        }
        guard let archivedIndex = result else {
            return
        }
        
        archivedTasks?[archivedIndex].isDone = true
        tasks?[index].isDone = true
        
    }

}



