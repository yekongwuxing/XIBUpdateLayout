//
//  ClockDetailCell.h
//  rch
//
//  Created by jiangmm on 17/4/10.
//  Copyright © 2017年 jiangmm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClockDetailModel.h"
@interface ClockDetailCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
//日期
@property (weak, nonatomic) IBOutlet UILabel *clockDate;
//迟到
@property (weak, nonatomic) IBOutlet UILabel *lateLabel;
//早退
@property (weak, nonatomic) IBOutlet UILabel *leaveEarly;
//位置异常
@property (weak, nonatomic) IBOutlet UILabel *dislocation;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lateLabelWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lateLabelLeft;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leaveEarlyWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leaveEarlyLeft;

@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong, nonatomic) ClockDetailModel *model;

@property (strong,nonatomic)UIViewController *topController;

@end
