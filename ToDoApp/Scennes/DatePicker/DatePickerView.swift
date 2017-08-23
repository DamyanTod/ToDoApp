//
//  DatePickerView.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

class DatePickerView: UIView, SubViewProtocol {

    @IBOutlet weak var navigationBarContainer: UIView!
    let navigationBar = NavigationBar.fromNib()
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var applyButton: Button!
    @IBOutlet weak var startsDateLabel: BaseLabel!
    @IBOutlet weak var startsInfoLabel: BaseLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        navigationBar.addLikeSubViewIn(parent: navigationBarContainer)
        setupButtons()
        setupLabels()
    }
    
    private func setupLabels () {
        startsInfoLabel.text = LocalizedStrings.kStarts
    }
    
    private func setupButtons () {
    
        navigationBar.setLeftButton(type: .back)
        applyButton.setButtonAppearance(type: .positiveAnswerButton, text: LocalizedStrings.kApply)
    
    }
    
}
