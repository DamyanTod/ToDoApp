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
        
        setupDelegates()
    }
    
    private func setupDelegates () {
        contentView.tasksTableView.dataSource = self
        contentView.tasksTableView.delegate = self
    }
    
    private func addTargets () {
        contentView.navigationBar.rightSideLeftButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        contentView.navigationBar.rightSideRightButton.addTarget(self, action: #selector(settingsButonPressed), for: .touchUpInside)
    }
}

//MARK: IBActions
extension TasksViewController {
    
    @IBAction func addButtonPressed (sender : Button) {
        //TODO: navigate to detail screen
    }
    
    @IBAction func settingsButonPressed (sender : Button) {
        //TODO: navigate to settings screen
    }

}

//MARK: UITableView delegates
extension TasksViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: navigate to detail screen
    }
    
}
