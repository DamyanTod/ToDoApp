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
    func setCategories(categories:String)
    func setDate(date:String)
    func setColor(color:String)
    func displayBottomLine(isNeeded : Bool)
    func displayUpperLine(isNeeded : Bool)
    func displayItem(state : CircleState)
    
}

class TasksCell: YMTableViewCell {
    
    @IBOutlet weak var labelTaskName: BaseLabel!
    @IBOutlet weak var labelTags: BaseLabel!
    
    @IBOutlet weak var labelDate: BaseLabel!
    @IBOutlet weak var viewForConnectElements: DrawCircleWithBottomAndUpperLine!
    
    @IBOutlet var categoryIndicatiors: [UIView]!

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
        let color = UIColor.colorWithHexString(hex: color)
        
        for view in categoryIndicatiors {
            view.backgroundColor = color
            if view.frame.size.height == view.frame.size.width {
                view.layer.cornerRadius = view.frame.width / 2
            }
        }
    }

    internal func setCategories(categories: String) {
        labelTags.text = categories
    }

    internal func setDate(date: String) {
        labelDate.text = date
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
