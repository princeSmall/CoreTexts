//
//  ViewController.m
//  CoreText
//
//  Created by le tong on 2018/8/30.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITableView *CTTableView;
@property (nonatomic ,strong)NSArray *dataArray;

@end

static NSString *const cellIndentifier = @"cellIndentifier";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.CTTableView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableView *)CTTableView{
    if (!_CTTableView) {
        _CTTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _CTTableView.delegate = self;
        _CTTableView.dataSource = self;
        _CTTableView.tableFooterView = [UIView new];
        [_CTTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIndentifier];
    }
    return _CTTableView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewViewController *newVC = [[NewViewController alloc]init];
    newVC.type = indexPath.row;
    [self.navigationController pushViewController:newVC animated:YES];
}
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"LayingOutView",@"ColumnsTextView",nil];
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
