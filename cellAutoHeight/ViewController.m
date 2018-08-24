//
//  ViewController.m
//  cellAutoHeight
//
//  Created by jiangwei.wang on 2018/8/20.
//  Copyright © 2018年 jiangwei.wang. All rights reserved.
//

#import "ViewController.h"

#import "CodeAutoHightVC.h"
#import "XIBAutoHeightVC.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic, strong) NSMutableArray *menuArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    [self bindEvent];
    [self loadMenuData];
}

- (void)configUI {
    [self.view addSubview:self.menuTableView];
    
    [self.menuTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(60);
        make.left.bottom.right.equalTo(self.view);
    }];
}

- (void)bindEvent {
    
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    
}

- (void)loadMenuData {
    self.menuArr = [@[@"Masonry自动布局Cell高度自适应",@"Xib自动布局高度自适应"] mutableCopy];
}

#pragma mark =============== UITableView datasource ==============
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"menuCellID";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.menuArr[indexPath.row];
    return cell;
}
#pragma mark =============== uitableview delegate ==============
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            CodeAutoHightVC *codeVC = [[CodeAutoHightVC alloc] init];
            [self.navigationController pushViewController:codeVC animated:YES];
        }
            break;
            
        case 1:{
            XIBAutoHeightVC *xibVC = [[XIBAutoHeightVC alloc] init];
            [self.navigationController pushViewController:xibVC animated:YES];
        }
            break;

        default:
            break;
    }
}




#pragma mark =============== setter getter ==============

- (UITableView *)menuTableView {
    if (!_menuTableView) {
        _menuTableView = [[UITableView alloc] init];
    }
    return _menuTableView;
}

- (NSMutableArray *)menuArr {
    if (!_menuArr) {
        _menuArr = [NSMutableArray array];
    }
    return _menuArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
