//
//  ViewController.m
//  fdtableviewcell
//
//  Created by 军魏 on 16/7/14.
//  Copyright © 2016年 weijun. All rights reserved.
//

#import "ViewController.h"
#import "customeTableViewCell.h"
#import "masoryCell.h"
#import "entity.h"
#import "Masonry.h"
#import <UITableView+FDTemplateLayoutCell.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic) UITableView* tableView;
@property (strong,nonatomic) NSArray* dataArray;
@property (nonatomic, assign) BOOL cellHeightCacheEnabled;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    //去掉系统自带分割线
       [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.tableView];
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    /**
     *  xib 初始化
     */
   //[_tableView registerNib:[UINib nibWithNibName:@"customeTableViewCell" bundle:nil] forCellReuseIdentifier:@"customeTableViewCell"];
    
    /**
     *  masrry 初始化
     */
    
   [self.tableView registerClass:[masoryCell class] forCellReuseIdentifier:@"masoryCell"];

    self.tableView.estimatedRowHeight = 250;
    self.tableView.fd_debugLogEnabled = YES;
    
    self.cellHeightCacheEnabled = YES;
    
    [self reloadData];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) reloadData {
    entity* model = [[entity alloc] init];
    model.contentUrl = @"http://img.tjkximg.com/image/2016-06/30/09/17994648381bykun.jpg";
    
    entity* model2 = [[entity alloc] init];
    model2.contentUrl = @"http://img.tjkximg.com/image/2016-06/30/09/17198422840gqgr1.jpg";
    
    entity* model3 = [[entity alloc] init];
    model3.contentUrl = @"http://img.tjkximg.com/image/2016-06/30/09/15344496801jt33r.jpg";

    self.dataArray = @[model,model2];
    [self.tableView reloadData];
}


#pragma -mark tableViewDataSource 

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:@"masoryCell" cacheByIndexPath:indexPath configuration:^(masoryCell* cell) {
        // 配置 cell 的数据源，和 "cellForRow" 干的事一致，比如：
        cell.object = self.dataArray[indexPath.row];
    }]+20;
}


- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    masoryCell* cell =  [tableView dequeueReusableCellWithIdentifier:@"masoryCell" forIndexPath:indexPath];
    // UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"customeTableViewCell"];
    cell.object = self.dataArray[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
