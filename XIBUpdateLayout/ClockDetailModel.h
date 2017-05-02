//
//  ClockDetailModel.h
//  rch
//
//  Created by jiangmm on 17/4/11.
//  Copyright © 2017年 jiangmm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClockDetailModel : NSObject
//考勤日期
@property (nonatomic,copy) NSString *clockDate;
//班次
@property (nonatomic,strong) NSArray *appealList;
//各种异常状态 0:迟到 1:位置异常 2:早退,3:缺勤】 如果有多个异常状态同时出现，用逗号隔开
@property (nonatomic,copy) NSString *dutyExceptionList;

@end
