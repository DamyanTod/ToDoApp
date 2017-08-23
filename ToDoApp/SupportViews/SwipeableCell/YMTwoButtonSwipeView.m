//
//  YMTwoButtonSwipeView.m
//  YMSwipeTableViewCell
//
//  Created by aluong on 8/25/15.
//  Copyright (c) 2015 Microsoft. All rights reserved.
//

#import "YMTwoButtonSwipeView.h"

static NSString * const kAction1Text = @"Undo";
static NSString * const kAction2Text = @"Share";
static NSString * const kAction3Text = @"Trash";

@implementation YMTwoButtonSwipeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        UIButton *leftButton = [[UIButton alloc] init];
        leftButton.backgroundColor = [UIColor clearColor];
        [leftButton.titleLabel setFont:[self defaultFont]];
        leftButton.userInteractionEnabled = YES;
        leftButton.translatesAutoresizingMaskIntoConstraints = NO;
        [leftButton setImage:[UIImage imageNamed:@"future_icon"] forState:UIControlStateNormal];
        [leftButton.imageView setTintColor:[UIColor whiteColor]];
        [leftButton setTitle:@"" forState:UIControlStateNormal];
        [self addSubview:leftButton];
        [leftButton addTarget:self action:@selector(leftButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.leftButton = leftButton;
        
        UIButton *middleButton = [[UIButton alloc] init];
        middleButton.backgroundColor = [UIColor clearColor];
        [middleButton.titleLabel setFont:[self defaultFont]];
        middleButton.userInteractionEnabled = YES;
        middleButton.translatesAutoresizingMaskIntoConstraints = NO;
        [middleButton setImage:[UIImage imageNamed:@"share_icon"] forState:UIControlStateNormal];
        [middleButton setTitle:@"" forState:UIControlStateNormal];
        [self addSubview:middleButton];
        [middleButton addTarget:self action:@selector(middleButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.middleButton = middleButton;
        
        UIButton *rightButton = [[UIButton alloc] init];
        rightButton.backgroundColor = [UIColor clearColor];
        [rightButton.titleLabel setFont:[self defaultFont]];
        rightButton.userInteractionEnabled = YES;
        rightButton.translatesAutoresizingMaskIntoConstraints = NO;
        [rightButton setImage:[UIImage imageNamed:@"delete_icon"] forState:UIControlStateNormal];
        [rightButton setTitle:@"" forState:UIControlStateNormal];
        [self addSubview:rightButton];
        [rightButton addTarget:self action:@selector(rightButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.rightButton = rightButton;
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[leftButton(54)]"
                                                                     options:0L
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(leftButton)]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[leftButton(54)]-8-|"
                                                                     options:0L
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(leftButton)]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[leftButton]-16-[middleButton(54)]"
                                                                     options:0L
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(leftButton, middleButton)]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[middleButton(54)]-8-|"
                                                                     options:0L
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(middleButton)]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[leftButton]-16-[middleButton]-16-[rightButton(54)]-8-|"
                                                                     options:0L
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(leftButton, middleButton, rightButton)]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[rightButton(54)]-8-|"
                                                                     options:0L
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(rightButton)]];
        
    }
    return self;
}

# pragma mark - Cell Swipe State Change Blocks
- (void)didSwipeWithTranslation:(CGPoint)translation
{
    // Do something during a swipe
}

- (void)didChangeMode:(YATableSwipeMode)mode
{
    // Do something after the cell mode has changed
}

# pragma mark - Button Methods
- (void)leftButtonTapped:(id)sender
{
    if (self.leftButtonTappedActionBlock) {
        self.leftButtonTappedActionBlock();
    }
}

- (void)middleButtonTapped:(id)sender
{
    if (self.middleButtonTappedActionBlock) {
        self.middleButtonTappedActionBlock();
    }
}

- (void)rightButtonTapped:(id)sender
{
    if (self.rightButtonTappedActionBlock) {
        self.rightButtonTappedActionBlock();
    }
}

# pragma mark - Helper Methods
- (UIFont *)defaultFont
{
    return [UIFont fontWithName:@"SegoeUI-Semibold" size:15.0];
}

- (UIColor *)swipeColorLeftButton
{
    return [UIColor darkGrayColor];
}

- (UIColor *)swipeColorMiddleButton
{
    return [UIColor blueColor];
}

- (UIColor *)swipeColorRightButton
{
    return [UIColor redColor];
}

@end
