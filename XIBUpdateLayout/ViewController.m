//
//  ViewController.m
//  XIBUpdateLayout
//
//  Created by jiangmm on 17/5/2.
//  Copyright © 2017年 jchvip.rch. All rights reserved.
//

#import "ViewController.h"
#import "ClockDetailModel.h"
#import "ClockDetailCell.h"
#import "LayoutViewController.h"
static NSString *const identifyClockDetailCell = @"ClockDetailCell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray   *mutArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的打卡记录";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:identifyClockDetailCell bundle:nil] forCellReuseIdentifier:identifyClockDetailCell];
    self.tableView.tableFooterView = [UIView new];
    [self setupData];
}


- (void)setupData{
    
    for (int i = 0; i < 9; i++) {
        NSArray *statusArrzy = @[@"1,2,3",@"1,3",@"0,1,2",@"1,2",@"0",@"2",@"3",@"1",@"0,1,3"];
        ClockDetailModel *model = [[ClockDetailModel alloc] init];
        model.clockDate = @"2017-09-07 星期三";
        model.dutyExceptionList = statusArrzy[i];
        [self.mutArray addObject:model];
        
    }
    [self.tableView reloadData];
}

#pragma mark -UITableViewDelegate && UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mutArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClockDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifyClockDetailCell];
    cell.topController = self;
    cell.model = self.mutArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 31+60*4;
    
}

- (IBAction)nextBtnClick:(id)sender {
    
    LayoutViewController *vc = [[LayoutViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


#pragma mark - lazy
-(NSMutableArray *)mutArray
{
    if (!_mutArray) {
        _mutArray = [[NSMutableArray alloc] init];
    }
    return _mutArray;
    
}


@end
