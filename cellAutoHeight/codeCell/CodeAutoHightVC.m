//
//  CodeAutoHightVC.m
//  cellAutoHeight
//
//  Created by jiangwei.wang on 2018/8/20.
//  Copyright © 2018年 jiangwei.wang. All rights reserved.
//

#import "CodeAutoHightVC.h"
#import "CodeCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "CodeCellModel.h"

@interface CodeAutoHightVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation CodeAutoHightVC
static NSString *cellID = @"codeCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"自动布局cell高度自适应";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //必须根据Cell 类别注册 cell
    [self.tableView registerClass:[CodeCell class] forCellReuseIdentifier:cellID];

    [self configUI];
    [self loadData];
}

- (void)configUI {
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (void)loadData {
    CodeCellModel *model = [[CodeCellModel alloc] init];
    model.name = @"Jarvis";
    model.content = @"Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 Jarvis NO.1 ";
    model.photoName = @"image1";
    
    
    [self.dataArr addObject:model];
    
    CodeCellModel *model1 = [[CodeCellModel alloc] init];
    model1.name = @"Wong";
    model1.content = @"god job god job god job god job god job god job god job god job god job god job god job god job god job god job god job god job god job god job god job god job god job ";
    model1.photoName = @"image1";
    
    [self.dataArr addObject:model1];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CodeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [CodeCell cellWithTableView:tableView];
    }
    [self setUpModelOfcell:cell indexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.tableView fd_heightForCellWithIdentifier:cellID cacheByIndexPath:indexPath configuration:^(id cell) {
        [self  setUpModelOfcell:cell indexPath:indexPath];
    }];
}

- (void)setUpModelOfcell:(CodeCell *)cell indexPath:(NSIndexPath *)indexPath {
    cell.cellModel = self.dataArr[indexPath.row];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        
    }
    return _tableView;
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
