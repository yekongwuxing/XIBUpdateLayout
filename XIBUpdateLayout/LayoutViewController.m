//
//  LayoutViewController.m
//  AutoLayoutTest
//
//  Created by jiangmm on 17/5/2.
//  Copyright © 2017年 Akring. All rights reserved.
//

#import "LayoutViewController.h"

@interface LayoutViewController ()
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;

@property (weak, nonatomic) IBOutlet UIView *thirdView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondViewLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leaveEarlyLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leaveEarlyWidth;
@end

@implementation LayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)hiddenBtnClick:(id)sender {
    
    self.secondViewLeft.constant = 0;
    self.secondViewWidth.constant = 0;
    
    self.leaveEarlyLeft.constant = 0;
    self.leaveEarlyWidth.constant = 0;
}

- (IBAction)showBtnClick:(id)sender {
    
    self.secondViewLeft.constant = 30;
    self.secondViewWidth.constant = 90;
    
    self.leaveEarlyLeft.constant = 10;
    self.leaveEarlyWidth.constant = 33;
}

- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
