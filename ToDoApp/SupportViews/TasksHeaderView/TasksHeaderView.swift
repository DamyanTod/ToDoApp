//
//  TasksHeaderView.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import UIKit

enum SegmentStatus : String {
    
    case available
    case completed
    
}

class TasksHeaderView : UIView, SubViewProtocol {
    
    static let height:CGFloat = 44
    
    @IBOutlet weak var taskStatusSegmentController: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.colorWithHexString(hex: HexColors.defaultLightGreenColor)
        
        setupSegment()
        
    }
    
    private func setupSegment () {
        taskStatusSegmentController.tintColor = UIColor.black
        
        taskStatusSegmentController.setTitle(SegmentStatus.available.rawValue, forSegmentAt: 0)
        taskStatusSegmentController.setTitle(SegmentStatus.completed.rawValue, forSegmentAt: 1)
    }
    
    
}
