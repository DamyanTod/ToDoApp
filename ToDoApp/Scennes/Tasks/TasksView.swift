//
//  TasksView.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import UIKit

class TasksView: UIView {
    
    @IBOutlet weak var navigationBarContainer: UIView!
    let navigationBar = NavigationBar.fromNib()
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupNavigationBar()
        setUpTableView()
    }
    
    private func setupNavigationBar () {
        navigationBar.addLikeSubViewIn(parent: navigationBarContainer)
    }
    
    private func setUpTableView() {
        
        //need to be registered cell
        tasksTableView.tableFooterView = UIView(frame: CGRect.zero)
        tasksTableView.separatorStyle = .none
        tasksTableView.rowHeight = UITableViewAutomaticDimension
        
    }
}
