//
//  ClockDetailListCell.h
//  rch
//
//  Created by jiangmm on 17/4/12.
//  Copyright © 2017年 jiangmm. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ClockDetailListCell : UITableViewCell

//打卡时间
@property (weak, nonatomic) IBOutlet UILabel *clockTime;
//规定上班时间
@property (weak, nonatomic) IBOutlet UILabel *dutyTime;
//位置异常
@property (weak, nonatomic) IBOutlet UILabel *clockPosition;
//申诉
@property (weak, nonatomic) IBOutlet UIButton *applyStatus;

@property (copy, nonatomic) NSString *dateString;

@property (strong,nonatomic)UIViewController *topController;

@end
