//
//  ClockDetailCell.m
//  rch
//
//  Created by jiangmm on 17/4/10.
//  Copyright © 2017年 jiangmm. All rights reserved.
//

#import "ClockDetailCell.h"
#import "ClockDetailListCell.h"
#import "UIColor+Colors.h"
static NSString *const identifyClockDetailListCell = @"ClockDetailListCell";

@implementation ClockDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    self.lateLabel.layer.masksToBounds = YES;
    self.lateLabel.layer.cornerRadius = 7;
    self.leaveEarly.layer.masksToBounds = YES;
    self.leaveEarly.layer.cornerRadius = 7;
    self.dislocation.layer.masksToBounds = YES;
    self.dislocation.layer.cornerRadius = 7;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:identifyClockDetailListCell bundle:nil] forCellReuseIdentifier:identifyClockDetailListCell];
}

#pragma mark -UITableViewDelegate && UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.dataArray.count;
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClockDetailListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifyClockDetailListCell];
    cell.topController = self.topController;
    cell.dateString = self.model.clockDate;
//    cell.model = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
    
}

-(void)setModel:(ClockDetailModel *)model
{
    _model = model;
    self.clockDate.text = model.clockDate;
    NSDictionary *statusDic = @{@"0":@"迟到",@"1":@"位置异常",@"2":@"早退",@"3":@"缺勤"};
    
    if ([model.dutyExceptionList isEqualToString:@""]) {
        self.lateLabel.hidden = YES;
        self.leaveEarly.hidden = YES;
        self.dislocation.hidden = YES;
    }else{
        
        self.lateLabelWidth.constant = 33;
        self.leaveEarlyWidth.constant = 33;

        NSArray *statusArray = [model.dutyExceptionList componentsSeparatedByString:@","];
        //数组是否包含某个元素
        if ([statusArray containsObject:@"1"] && [statusArray containsObject:@"3"]){
            if (statusArray.count == 2){
                self.lateLabel.hidden = NO;
                self.leaveEarly.hidden = NO;
                self.dislocation.hidden = YES;
                self.leaveEarlyWidth.constant = 60;
                for (int i = 0; i < statusArray.count; i++) {
                    NSString *type = statusArray[i];
                    if ([type integerValue] == 3) {
                        self.lateLabel.text = statusDic[type];
                        self.lateLabel.backgroundColor = [UIColor colorFromHexString:@"#ed7052"];
                    }else{
                        self.leaveEarly.text = statusDic[type];
                        
                        
                    }
                    
                }
                
            }else{
                self.lateLabel.hidden = NO;
                self.leaveEarly.hidden = NO;
                self.dislocation.hidden = NO;
                for (int i = 0; i < statusArray.count; i++) {
                    NSString *type = statusArray[i];
                    if ([type integerValue] == 3) {
                        self.lateLabel.text = statusDic[type];
                        self.lateLabel.backgroundColor = [UIColor colorFromHexString:@"#ed7052"];
                        
                    }else if ([type integerValue] == 1) {
                        self.dislocation.text = statusDic[type];
                    }else{
                        self.leaveEarly.text = statusDic[type];
                    }
                    
                }
            }
            
        }else{
            if ([statusArray containsObject:@"3"]) {
                if (statusArray.count == 1) {
                    self.lateLabel.hidden = NO;
                    self.leaveEarly.hidden = YES;
                    self.dislocation.hidden = YES;
                    self.lateLabel.text = statusDic[@"3"];
                    self.lateLabel.backgroundColor = [UIColor colorFromHexString:@"#ed7052"];
                    
                }else{
                    self.lateLabel.hidden = NO;
                    self.leaveEarly.hidden = NO;
                    self.dislocation.hidden = YES;
                    for (int i = 0; i < statusArray.count; i++) {
                        NSString *type = statusArray[i];
                        if ([type integerValue] == 3) {
                            self.lateLabel.text = statusDic[type];
                            self.lateLabel.backgroundColor = [UIColor colorFromHexString:@"#ed7052"];
                        }else{
                            self.leaveEarly.text = statusDic[type];
                        }
                    }
                    
                }
            }else if ([statusArray containsObject:@"1"]) {
                if (statusArray.count == 1) {
                    self.lateLabel.hidden = NO;
                    self.leaveEarly.hidden = YES;
                    self.dislocation.hidden = YES;
                    self.lateLabelWidth.constant = 60;
                    self.lateLabel.text = statusDic[@"1"];
                    
                }else if (statusArray.count == 2){
                    self.lateLabel.hidden = NO;
                    self.leaveEarly.hidden = NO;
                    self.dislocation.hidden = YES;
                    self.leaveEarlyWidth.constant = 60;
                    self.lateLabel.backgroundColor = [UIColor colorFromHexString:@"#ff943e"];
                    self.leaveEarly.backgroundColor = [UIColor colorFromHexString:@"#ff943e"];
                    for (int i = 0; i < statusArray.count; i++) {
                        NSString *type = statusArray[i];
                        if ([type integerValue] == 1) {
                            self.leaveEarly.text = statusDic[type];
                        }else{
                            self.lateLabel.text = statusDic[type];
                        }
                        
                    }
                    
                }else{
                    self.lateLabel.hidden = NO;
                    self.leaveEarly.hidden = NO;
                    self.dislocation.hidden = NO;
                    for (int i = 0; i < statusArray.count; i++) {
                        NSString *type = statusArray[i];
                        if ([type integerValue] == 0) {
                            self.lateLabel.text = statusDic[type];
                        }else if ([type integerValue] == 1) {
                            self.dislocation.text = statusDic[type];
                        }else{
                            self.leaveEarly.text = statusDic[type];
                        }
                        
                    }
                    
                }
                
            }else{
                if (statusArray.count == 1) {
                    self.lateLabel.hidden = NO;
                    self.leaveEarly.hidden = YES;
                    self.dislocation.hidden = YES;
                    self.lateLabel.text = statusDic[statusArray[0]];
                    self.lateLabel.backgroundColor = [UIColor colorFromHexString:@"#ff943e"];
                    
                    
                }else{
                    self.lateLabel.hidden = NO;
                    self.leaveEarly.hidden = NO;
                    self.dislocation.hidden = YES;
                    self.lateLabel.text = statusDic[statusArray[0]];
                    self.leaveEarly.text = statusDic[statusArray[1]];
                    self.lateLabel.backgroundColor = [UIColor colorFromHexString:@"#ff943e"];
                    self.leaveEarly.backgroundColor = [UIColor colorFromHexString:@"#ff943e"];
                    
                }
            }
            
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
