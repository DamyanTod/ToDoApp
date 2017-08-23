//
//  TasksViewController.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

protocol TasksViewControllerInput: class {
    func reloadTableView()
    func jitterAddButton()
}

class TasksViewController: UIViewController, TasksViewControllerInput {
    
    var presenter: TasksPresenter!
    
    fileprivate var contentView = TasksView.fromNib()
    
    // MARK: - Object lifecycle
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Do not ask for presenter before this call
        self.setupVIPER()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Do not ask for presenter before this call
        self.setupVIPER()
    }
    
    // MARK: - Initilization
    func setupVIPER() {
        TasksConfigurator.configure(viewController: self)
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.addLikeSubViewIn(parent: self.view)
        setupDelegates()
        addTargets()
        filterTasks(status: contentView.tableViewHeader.getStatus())
    }
    
    private func setupDelegates () {
        contentView.tasksTableView.dataSource = self
        contentView.tasksTableView.delegate = self
    }
    
    private func addTargets () {
        contentView.navigationBar.rightSideLeftButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        contentView.navigationBar.rightSideRightButton.addTarget(self, action: #selector(settingsButonPressed), for: .touchUpInside)
        contentView.tableViewHeader.taskStatusSegmentController.addTarget(self, action: #selector(taskStatusChanged), for: .valueChanged)
    }
    
    fileprivate func filterTasks (status : SegmentStatus?) {
        if let status = status {
            presenter.filterTasks(value : status)
        }
    }
}

//MARK: Input Delegate
extension TasksViewController {
    func reloadTableView() {
        contentView.tasksTableView.reloadData()
    }
    
    func jitterAddButton() {
        contentView.navigationBar.rightSideLeftButton.jitter()
    }
}



//MARK: IBActions
extension TasksViewController {
    
    @IBAction func addButtonPressed (sender : Button) {
        presenter.pushToDetailTaskController(task: nil)
    }
    
    @IBAction func settingsButonPressed (sender : Button) {
        //TODO: navigate to settings screen
    }
    
    @IBAction func taskStatusChanged (sender : UISegmentedControl) {
        if sender == contentView.tableViewHeader.taskStatusSegmentController {
            filterTasks(status: contentView.tableViewHeader.getStatus())
        }
    }

}

//MARK: UITableView delegates
extension TasksViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tasksCount = presenter.tasks?.count else {
            return 0
        }
        
        return tasksCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TasksCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TasksCell.nibName) as! TasksCell
        
        presenter.populateCell(cell: cell, indexPath : indexPath)
        
        cell.delegate = self
        cell.swipeEffect = YATableSwipeEffect.trail
        
        if let status = contentView.tableViewHeader.getStatus() {
            if status == .completed {
                cell.leftViewSwipingEnabled = false
            } else {
                cell.leftViewSwipingEnabled = true
            }
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return contentView.tableViewHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TasksHeaderView.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pushToDetailTaskController(task: presenter.tasks?[indexPath.row])
    }
    
}
//MARK: YMTableViewCellDelegate delegates
extension TasksViewController : YMTableViewCellDelegate {
    func swipeableTableViewCell(_ cell: YMTableViewCell!, didTriggerLeftViewButtonWith index: Int) {
        print("left")
    }
    
    func swipeableTableViewCell(_ cell: YMTableViewCell!, didTriggerRightViewButtonWith index: Int) {
        if index == YMTableViewCellTwoButtonSwipeViewTrashButtonIndex { // 2
            if let indexpath = contentView.tasksTableView.indexPath(for: cell) {
                presenter.removeItem(indexpath.row)
            }
        } else if index == YMTableViewCellTwoButtonSwipeViewShareButtonIndex {
            //TODO: Share
            print("share")
        } else if index == YMTableViewCellTwoButtonSwipeViewUndoButtonIndex {
            //TODO: show time changing screen
            print("show time changing screen")
        }
    }
    
    func swipeableTableViewCell(_ cell: YMTableViewCell!, didCompleteSwipe swipeMode: YATableSwipeMode) {
        if swipeMode == YATableSwipeMode.leftON {
            if let indexpath = contentView.tasksTableView.indexPath(for: cell) {
                presenter.changeTaskStateToDone(indexpath.row)
                filterTasks(status: contentView.tableViewHeader.getStatus())
            }
        }
    }
}





