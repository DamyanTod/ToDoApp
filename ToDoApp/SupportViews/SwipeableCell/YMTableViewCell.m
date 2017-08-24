//
//  YMTableViewCell.m
//  YMSwipeTableViewCell
//
//  Created by aluong on 8/26/15.
//  Copyright (c) 2015 Microsoft. All rights reserved.
//

#import "YMTableViewCell.h"
#import "YMTwoButtonSwipeView.h"
#import "YMOneButtonSwipeView.h"
#import "UITableViewCell+Swipe.h"
#import <QuartzCore/QuartzCore.h>
#import "ToDoApp-Swift.h"


const NSInteger YMTableViewCellTwoButtonSwipeViewTrashButtonIndex = 2;
const NSInteger YMTableViewCellTwoButtonSwipeViewShareButtonIndex = 1;
const NSInteger YMTableViewCellTwoButtonSwipeViewUndoButtonIndex = 0;
const NSInteger YMTableViewCellHeight = 80;
static const NSInteger kRightSwipeViewWidth = 210;

@interface YMTableViewCell()



@end

@implementation YMTableViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self = [self justInit:self];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [self justInit:self];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [self justInit:self];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [self justInit:self];
    }
    return self;
}

- (YMTableViewCell *) justInit :(YMTableViewCell *) cell {
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.font = [self defaultFont];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    // --- Set the background color of the swipe container view ---
    self.swipeContainerViewBackgroundColor = [UIColor grayColor];
    
    __weak __typeof(self)weakSelf = cell;
    
    // --- Create the right view ---
    YMTwoButtonSwipeView *rightView = [[YMTwoButtonSwipeView alloc] initWithFrame:CGRectMake(0, 0, kRightSwipeViewWidth, YMTableViewCellHeight)];
    rightView.backgroundColor = [UIColor colorWithRed:0.99 green:0.4 blue:0.145 alpha:1];

    rightView.leftButtonTappedActionBlock = ^(void) {
        if (weakSelf.delegate) {
            [weakSelf.delegate swipeableTableViewCell:weakSelf didTriggerRightViewButtonWithIndex:YMTableViewCellTwoButtonSwipeViewUndoButtonIndex];
        }
    };
    
    rightView.middleButtonTappedActionBlock = ^(void) {
        if (weakSelf.delegate) {
            [weakSelf.delegate swipeableTableViewCell:weakSelf didTriggerRightViewButtonWithIndex:YMTableViewCellTwoButtonSwipeViewShareButtonIndex];
        }
    };
    
    // Call the didTriggerRightViewButtonWithIndex delegate when one of the right view button is triggered
    rightView.rightButtonTappedActionBlock = ^(void) {
        if (weakSelf.delegate) {
            [weakSelf.delegate swipeableTableViewCell:weakSelf didTriggerRightViewButtonWithIndex:YMTableViewCellTwoButtonSwipeViewTrashButtonIndex];
        }
    };
    
    // --- Create the left view ---
    YMOneButtonSwipeView *leftView = [[YMOneButtonSwipeView alloc] init];
    
    leftView.backgroundColor = [UIColor whiteColor];
    UIImage *checkImage = [[UIImage imageNamed:@"checkmark_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [leftView.aButton setImage:checkImage forState:UIControlStateNormal];
    leftView.aButton.imageView.tintColor = [UIColor blackColor];
    leftView.aButton.backgroundColor = [UIColor defaultLightGreenColor];
    
    // Call the didTriggerLeftViewButtonWithIndex delegate when the left view button is triggered
    leftView.buttonTappedActionBlock= ^(void) {
        if (weakSelf.delegate) {
            [weakSelf.delegate swipeableTableViewCell:weakSelf didTriggerLeftViewButtonWithIndex:0];
        }
    };
    
    // --- Notify the left and right views during a swipe by setting the swipeBlock ---
    [self setSwipeBlock:^(UITableViewCell *cell, CGPoint translation){
        if (translation.x < 0) {
            [rightView didSwipeWithTranslation:translation];
        }
        else {
            [leftView didSwipeWithTranslation:translation];
        }
    }];
    
    // --- Call the didCompleteSwipe delegate when the the cell mode has changed ---
    [self setModeChangedBlock:^(UITableViewCell *cell, YATableSwipeMode mode){
        [leftView didChangeMode:mode];
        [rightView didChangeMode:mode];
        
        if (weakSelf.delegate) {
            [weakSelf.delegate swipeableTableViewCell:weakSelf didCompleteSwipe:mode];
        }
    }];
    
    cell.rightSwipeView = rightView;
    cell.leftSwipeView = leftView;
    
    // --- Add the left and right views ---
    [cell addLeftView:cell.leftSwipeView];
    [cell addRightView:cell.rightSwipeView];
    
    // --- Enable multipe cells to be swiped at once ---
    cell.allowMultiple = YES;
    
    
    return cell;
}


- (void)prepareForReuse
{
    [self resetSwipe:nil withAnimation:NO];
    [super prepareForReuse];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    

    self.leftSwipeView.frame = self.bounds;
    
    // Make some layout adjustments to the image in the left swipe view
    YMOneButtonSwipeView *leftView = (YMOneButtonSwipeView *)self.leftSwipeView;
    leftView.aButton.contentHorizontalAlignment = (self.swipeEffect == YATableSwipeEffectUnmask) ? UIControlContentHorizontalAlignmentLeft : UIControlContentHorizontalAlignmentRight;
    CGFloat leftInset = (self.swipeEffect == YATableSwipeEffectUnmask) ? 20.0 : 0;
    CGFloat rightInset = (self.swipeEffect == YATableSwipeEffectUnmask) ? 0 : 20.0;
    [leftView.aButton setImageEdgeInsets:UIEdgeInsetsMake(0, leftInset, 0, rightInset)];
    
    // Set the snap thresholds
    self.rightSwipeSnapThreshold = self.bounds.size.width * 0.3;
    self.leftSwipeSnapThreshold = self.bounds.size.width * 0.1;
}

- (UIFont *)defaultFont
{
    return [UIFont defaultFontFamilyWithFontSize:12.0];
}

@end
