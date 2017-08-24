//
//  TaskCategoriesRouter.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

protocol TaskCategoriesRouterInput {
    
    func navigateToSomewhere()
    func navigateToPreviusController()
}

class TaskCategoriesRouter: TaskCategoriesRouterInput {
    
    weak var viewController: TaskCategoriesViewController?
    
    // MARK: - Navigation
    
    func navigateToSomewhere() {
        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
        
        // 1. Trigger a storyboard segue
        // self.viewController?.performSegueWithIdentifier("ShowSomewhereScene", sender: nil)
        
        // 2. Present another view controller programmatically
        // self.viewController?.presentViewController(someWhereViewController, animated: true, completion: nil)
        
        // 3. Ask the navigation controller to push another view controller onto the stack
        // self.viewController?.navigationController?.pushViewController(destinationViewController, animated: true)
        
        // 4. Present a view controller from a different storyboard
        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
        // self.viewController?.navigationController?.pushViewController(someWhereViewController, animated: true)
        
        // If the destination controller has a delegate, which you need to handle
        // implement in the viewController and set it here.
        // destinationViewController.delegate = self.viewController
    }
    
    func navigateToPreviusController() {
        let _ = viewController?.navigationController?.popViewController(animated: true)
    }
    
}
