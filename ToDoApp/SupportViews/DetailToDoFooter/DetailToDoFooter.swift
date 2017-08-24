//
//  DetailToDoFooter.swift
//  ToDoApp
//
//  Created by El Capitan on 8/23/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import Foundation
import UIKit

class DetailToDoFooter : UIView, SubViewProtocol {
    
    static let height:CGFloat = 132
    
    @IBOutlet weak var timeBtn: Button!
    @IBOutlet weak var categoriesBtn: Button!
    
    @IBOutlet weak var indicatorColorView: UIView!
    @IBOutlet var colorButtons: [UIButton]!
    
    @IBOutlet var footerImages: [UIImageView]!
    
    let colors = [HexColors.defaultDarkGreenColor, HexColors.defaultDarkOrangenColor, HexColors.defaultRedColor, HexColors.lightPinkColor, HexColors.defaultLightOrangeColor]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupImageViews()
        setupBtns()
        
    }
    
    private func setupBtns () {
        timeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        categoriesBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        timeBtn.setTitle(NSDate().getUserLocalDate() , for: .normal)
        categoriesBtn.setTitle("do", for: .normal)

        makeCircleView(view: indicatorColorView, hexColor: colors[0])
        
        if colorButtons.count == colors.count {
            for button in colorButtons {
                makeCircleView(view: button, hexColor: colors[button.tag])
            }
        }
        
    }
    
    private func makeCircleView (view : UIView, hexColor : String) {
        view.backgroundColor = UIColor.colorWithHexString(hex: hexColor)
        view.layer.cornerRadius = view.frame.height/2
        view.clipsToBounds = true
    }
    
    private func setupImageViews () {
        for imageView in footerImages {
            imageView.tintColor = UIColor.black
        }
    }
    
    
}
