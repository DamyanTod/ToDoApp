//
//  TasksCell.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit


protocol TasksCellProtocol {
    
    func setTitle(title:String)
    func setCategory(category:String)
    func setDate(date:String)
    func setColor(color:String)
    func displayBottomLine(isNeeded : Bool)
    func displayUpperLine(isNeeded : Bool)
    func displayItem(state : CircleState)
    
}

class TasksCell: YMTableViewCell {
    
    @IBOutlet weak var labelTaskName: BaseLabel!
    @IBOutlet weak var labelTags: BaseLabel!
    @IBOutlet weak var viewForConnectElements: DrawCircleWithBottomAndUpperLine!
    
    @IBOutlet weak var bottomSeparator: UIView!
    static let cellHeight:CGFloat = 70
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.bottomSeparator.backgroundColor = UIColor.black
        
    }
    
}

//MARK: Public methods
extension TasksCell: TasksCellProtocol {
    internal func setColor(color: String) {
        print(color)
    }

    internal func setCategory(category: String) {
        labelTags.text = category
    }

    internal func setDate(date: String) {
        print(date)
    }

    internal func setTitle(title: String) {
        labelTaskName.text = title
    }
    
    func displayBottomLine(isNeeded: Bool) {
        viewForConnectElements.isBottomLineNeeded = isNeeded
    }
    
    func displayUpperLine(isNeeded: Bool) {
        viewForConnectElements.isUpperLineNeeded = isNeeded
    }
    
    func displayItem(state: CircleState) {
        viewForConnectElements.circleState = state
    }

    
}
