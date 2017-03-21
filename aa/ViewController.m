//
//  ViewController.m
//  aa
//
//  Created by Cain on 16/11/29.
//  Copyright © 2016年 Goldian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic , strong)NSArray *dataArray;
@property (nonatomic , strong)NSMutableArray *buttonArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scroll = [[UIScrollView alloc]init];
    scroll.backgroundColor = [UIColor redColor];
    scroll.pagingEnabled = YES;
    
    CGFloat margin = 10;
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - 4*margin)/3;
    int column = 3;
    
    
    [scroll setContentSize:CGSizeMake((self.dataArray.count/12+1)*[UIScreen mainScreen].bounds.size.width, 0)];
    
    for (int i = 0; i < self.dataArray.count; i++) {
        int col = i % column;
        int row = i / column;
        
        CGFloat x =  (col + 1) * margin + col * w + [UIScreen mainScreen].bounds.size.width *(i / 12);
        CGFloat y = (row%4 + 1) *margin +row%4 * w;
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, w)];
        button.tag = i;
        [button addTarget:self action:@selector(actionClickButton:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor cyanColor];
        [scroll addSubview:button];
        
    }
    
    self.view = scroll;
}

- (void)actionClickButton:(UIButton *)sender
{
    [self.buttonArray addObject:sender];
    NSLog(@"%@",self.buttonArray);
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""];
    }
    return _dataArray;
}

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

@end
