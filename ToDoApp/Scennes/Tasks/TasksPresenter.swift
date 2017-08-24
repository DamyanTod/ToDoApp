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
    func pushToDetailTaskController(task : Task?)
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
    
    required init(with interactor: TasksInteractorInput, router: TasksRouterInput) {
        
        self.interactor = interactor
        self.router = router
        
    }
    
    fileprivate func performActionAfterChangedTasks (tasks : [Task]?) {

        if let tasks = tasks,
            tasks.count != 0 {
            print(tasks)
            view?.reloadTableView()
        } else {
            view?.reloadTableView()
            view?.jitterAddButton()
            print("no tasks")
        }
        
    }

}

//MARK: View Input
extension TasksPresenter {
    func populateCell(cell: TasksCellProtocol, indexPath: IndexPath) {
        
        if let tasks = tasks {
            cell.setDate(date: tasks[indexPath.row].completionDate?.getUserLocalDate() ?? "")
            cell.setTitle(title: tasks[indexPath.row].title ?? "")
            cell.setColor(color: tasks[indexPath.row].color)
            cell.setCategories(categories: tasks[indexPath.row].categories ?? "")
            
            cell.displayBottomLine(isNeeded: indexPath.row != tasks.count - 1)
            cell.displayUpperLine(isNeeded: indexPath.row != 0)
            cell.displayItem(state: tasks[indexPath.row].isDone ? .filled : .clock)
        }
    }
    
    func filterTasks(value: SegmentStatus) {
        
        archivedTasks = interactor.getTasks()

        switch value {
        case .available:
            if archivedTasks != nil {
                self.tasks = archivedTasks!.filter({ $0.isDone == false })
            }
        case .completed:
            if archivedTasks != nil {
                self.tasks = archivedTasks!.filter({ $0.isDone == true })
            }
        }
    }
    
    func removeItem(_ index: Int) {
        if let archivedTasks = archivedTasks {
            var result:Int?
            var i = 0
            if let item = tasks?[index] {
                for archivedItem in archivedTasks {
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
            
            interactor.removeTask(archivedTasks[archivedIndex])
            self.archivedTasks = interactor.getTasks()
            tasks?.remove(at: index)
            performActionAfterChangedTasks(tasks: tasks)
        }
    }
    
    func changeTaskStateToDone(_ index: Int) {
        if let archivedTasks = archivedTasks {
            var result:Int?
            var i = 0
            if let item = tasks?[index] {
                for archivedItem in archivedTasks {
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
            archivedTasks[archivedIndex].isDone = true
            tasks?[index].isDone = true
        }
    }
    
    func pushToDetailTaskController(task : Task?) {
        router.navigateToDetailTasks(task : task)
    }
}



