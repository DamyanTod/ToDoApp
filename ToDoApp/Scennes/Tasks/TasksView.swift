//
//  TasksView.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import UIKit

class TasksView: UIView, SubViewProtocol {
    
    @IBOutlet weak var navigationBarContainer: UIView!
    let navigationBar = NavigationBar.fromNib()
    
    let tableViewHeader = TasksHeaderView.fromNib()
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupNavigationBar()
         setUpTableView()
    }
    
    private func setupNavigationBar () {
        navigationBar.addLikeSubViewIn(parent: navigationBarContainer)
        navigationBar.setRightSideRightButton(type: .settings)
        navigationBar.setRightSideLeftButton(type: .add)
    }
    
    private func setUpTableView() {
        tasksTableView.register(UINib(nibName: TasksCell.nibName , bundle: nil), forCellReuseIdentifier: TasksCell.nibName)
        tasksTableView.tableFooterView = UIView(frame: CGRect.zero)
        tasksTableView.separatorStyle = .none
        tasksTableView.rowHeight = UITableViewAutomaticDimension
    }
}
