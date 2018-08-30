//
//  NewViewController.m
//  CoreText
//
//  Created by le tong on 2018/8/30.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "NewViewController.h"
#import "LayingOutView.h"
#import "ColumnsTextView.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutOnSubviews];
    // Do any additional setup after loading the view.
}
- (void)layoutOnSubviews{
    switch (self.type) {
        case 0:{
            LayingOutView *view = [[LayingOutView alloc]initWithFrame:self.view.bounds];
            [self.view addSubview:view];
        }
            break;
        case 1:{
            ColumnsTextView *view = [[ColumnsTextView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
            [self.view addSubview:view];
        }
            break;
        default:
            break;
    }
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
