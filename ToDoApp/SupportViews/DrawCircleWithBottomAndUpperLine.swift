//
//  DrawCircleWithBottomAndUpperLine.swift
//  ToDoApp
//
//  Created by El Capitan on 8/22/17.
//  Copyright © 2017 DamyanTod. All rights reserved.
//

import UIKit

enum CircleState {
    
    case filledWithDefaultAppColor
    case filledWithGreenColor
    case clock
    case addTask
}


@IBDesignable
class DrawCircleWithBottomAndUpperLine: UIView {
    
    fileprivate let startAngle: CGFloat = 0.0
    fileprivate let endAngle = 2 * CGFloat.pi
    
    fileprivate var circleCenter:CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    fileprivate var radius:CGFloat {
        return getCircleRadiusFromState(viewState: circleState)
    }
    
    var circleState: CircleState = .clock {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var isFilledInside:Bool = false {
        didSet{
            self.setNeedsDisplay()
        }
    }
    var isBottomLineNeeded:Bool = false {
        didSet{
            self.setNeedsDisplay()
        }
    }
    var isUpperLineNeeded:Bool = false {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawCircleWithBottomAndUpperLine()
    }
    
    func drawCircleWithBottomAndUpperLine () {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let color = getColorForState(viewState: circleState)
        context.setStrokeColor(color)
        context.setLineWidth(GlobalNumbers.defaultAppLineWidth)
        context.setFillColor(color)
        
        context.addArc(center: circleCenter,
                       radius: radius,
                       startAngle: startAngle,
                       endAngle: endAngle,
                       clockwise: false)
        
        filledInside(context: context)
        
        addBottomline(context: context)
        
        addUpperLine(context: context)
        
        context.drawPath(using: .stroke)
    }
    
    private func filledInside (context : CGContext) {
        
        switch circleState {
        case .clock:
            context.move(to: CGPoint(x: bounds.midX, y: bounds.midY))
            context.addLine(to: CGPoint(x: bounds.midX + 2, y: bounds.midY - 7))
            context.move(to: CGPoint(x: bounds.midX , y: bounds.midY))
            context.addLine(to: CGPoint(x: bounds.midX - 4.5, y: bounds.midY))
            
        case .filledWithDefaultAppColor:
            context.fillEllipse(in: CGRect(x: bounds.midX - radius, y:bounds.midY - radius, width: radius * 2, height: radius * 2))
            
        case .filledWithGreenColor:
            context.fillEllipse(in: CGRect(x: bounds.midX - radius, y:bounds.midY - radius, width: radius * 2, height: radius * 2))

        case .addTask:
            context.move(to: CGPoint(x: bounds.midX + 4, y: bounds.midY))
            context.addLine(to: CGPoint(x: bounds.midX - 4, y: bounds.midY))
            context.move(to: CGPoint(x: bounds.midX , y: bounds.midY + 4))
            context.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY - 4))

        }
        
    }
    
    private func addBottomline(context : CGContext) {
        if isBottomLineNeeded {
            context.move(to: CGPoint(x: bounds.midX, y: bounds.midY + radius))
            
            context.addLine(to: CGPoint(x: bounds.midX, y: bounds.height))
        }
    }
    
    private func addUpperLine(context : CGContext) {
        if isUpperLineNeeded {
            context.move(to: CGPoint(x: bounds.midX, y: bounds.midY - radius))
            
            context.addLine(to: CGPoint(x: bounds.midX, y: 0))
        }
    }
    
    
    private func  getColorForState (viewState : CircleState) -> CGColor {
        switch viewState {
        case .clock:
            return UIColor.black.cgColor
        case .filledWithDefaultAppColor:
            return UIColor.colorWithHexString(hex: HexColors.defaultLightGreenColor).cgColor
        case .filledWithGreenColor:
            return UIColor.colorWithHexString(hex: HexColors.defaultLightGreenColor).cgColor
        case .addTask:
            return UIColor.colorWithHexString(hex: HexColors.defaultLightGreenColor).cgColor
        }
    }
    
    private func getCircleRadiusFromState (viewState : CircleState) -> CGFloat {
        
        switch viewState {
        case .clock:
            return min(bounds.midX,bounds.midY) * 0.4 - GlobalNumbers.defaultAppLineWidth
        case .filledWithDefaultAppColor:
            return min(bounds.midX,bounds.midY) * 0.25 - GlobalNumbers.defaultAppLineWidth
        case .filledWithGreenColor:
            return min(bounds.midX,bounds.midY) * 0.25 - GlobalNumbers.defaultAppLineWidth
        case .addTask:
            return min(bounds.midX,bounds.midY) * 0.3 - GlobalNumbers.defaultAppLineWidth

        }
    }
    
}

