//
//  DetailTaskRouter.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright (c) 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

protocol DetailTaskRouterInput {
    
    func navigateToSomewhere()
    func navigateToPreviousController()
    func navigateToDatePicker(_ task : Task?)
}

class DetailTaskRouter: DetailTaskRouterInput {

    weak var viewController: DetailTaskViewController?
    
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
    
    func navigateToPreviousController() {
        let _ = viewController?.navigationController?.popViewController(animated: true)
    }
    
    func navigateToDatePicker(_ task : Task?) {
        if let viewController = UIStoryboard(name: Transitions.mainStoryboard, bundle: nil).instantiateViewController(withIdentifier: Transitions.datePickerController) as? DatePickerViewController {
            viewController.presenter.task = task
            self.viewController?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}
