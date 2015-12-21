//
//  ViewController.m
//  SubViewObtainAndResponse
//
//  Created by 王斌 on 15/12/21.
//  Copyright © 2015年 Changhong electric Co., Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong)UIView *bgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addSubviews];
    
    [self addTwoButtons];
    
    
    UIView *fatherView = [[UIView alloc] initWithFrame:CGRectMake(20, 400, 100, 40)];
    fatherView.backgroundColor = [UIColor redColor];
    
    UIButton *kidButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [kidButton setFrame:CGRectMake(70, 0, 60, 30)];
    [kidButton setBackgroundColor:[UIColor blueColor]];
    [kidButton setTitle:@"test" forState:UIControlStateNormal];
    [kidButton.titleLabel setFont:[UIFont fontWithName:@"Arial" size:15]];
    [kidButton addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];

    [fatherView addSubview:kidButton];
    //thirdView.clipsToBounds = YES;
    [self.view addSubview:fatherView];

}

- (void)test{
    NSLog(@"\n\n 点击了kidButton \n\n");
}

- (void)addSubviews{
    //设置bgView
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 290)];
    [self.bgView setBackgroundColor:[UIColor grayColor]];
    self.bgView.tag = 1000;
    [self.view addSubview:self.bgView];
    //
    //添加subView1
    UIView *subView1 = [[UIView alloc]initWithFrame:CGRectMake(20, 40, 200, 160)];
    [subView1 setBackgroundColor:[UIColor orangeColor]];
    subView1.tag = 1111;
    [self.bgView addSubview:subView1];
    //
    //添加subView2
    UILabel *subView2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 220, 200, 40)];
    [subView2 setBackgroundColor:[UIColor brownColor]];
    subView2.tag = 13;
    subView2.text = @"  subView2 tag:13";
    [self.bgView addSubview:subView2];
    //
    //添加subView11，12，13
    UILabel *subView11 = [[UILabel alloc]initWithFrame:CGRectMake(25, 10, 150, 40)];
    subView11.text = @"  subView11 tag:11";
    [subView11 setBackgroundColor:[UIColor whiteColor]];
    subView11.tag = 11;
    [subView1 addSubview:subView11];
    //
    UILabel *subView12 = [[UILabel alloc]initWithFrame:CGRectMake(25, 60, 150, 40)];
    subView12.text = @"  subView12 tag:11";
    [subView12 setBackgroundColor:[UIColor greenColor]];
    subView12.tag = 11;
    [subView1 addSubview:subView12];
    //
    UILabel *subView13 = [[UILabel alloc]initWithFrame:CGRectMake(25, 110, 150, 40)];
    subView13.text = @"  subView13 tag:13";
    [subView13 setBackgroundColor:[UIColor yellowColor]];
    subView13.tag = 13;
    [subView1 addSubview:subView13];
}

- (void)addTwoButtons{
    //button1
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setFrame:CGRectMake(30, 300, 90, 40)];
    [button1 setBackgroundColor:[UIColor blueColor]];
    [button1 setTitle:@"show tag 11" forState:UIControlStateNormal];
    [button1.titleLabel setFont:[UIFont fontWithName:@"Arial" size:15]];
    [button1 addTarget:self action:@selector(showTag11) forControlEvents:UIControlEventTouchUpInside];
    button1.layer.cornerRadius = 5;
    button1.layer.masksToBounds = YES;
    button1.tag = 200;
    [self.view addSubview:button1];
    //
    //button2
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(130, 300, 90, 40)];
    [button2 setBackgroundColor:[UIColor blueColor]];
    [button2 setTitle:@"show tag 13" forState:UIControlStateNormal];
    [button2.titleLabel setFont:[UIFont fontWithName:@"Arial" size:15]];
    [button2 addTarget:self action:@selector(showTag13) forControlEvents:UIControlEventTouchUpInside];
    button2.layer.cornerRadius = 5;
    button2.layer.masksToBounds = YES;
    button2.tag = 201;
    [self.view addSubview:button2];


}

- (void)showTag11{
    //先隐藏所有
    for (UIView *tempView in [self.bgView subviews]) {
        for (UIView *view2 in tempView.subviews) {
            if ([view2 isKindOfClass:[UILabel class]]) {
                view2.hidden = YES;
            }
        }
        if ([tempView isKindOfClass:[UILabel class]]) {
            tempView.hidden = YES;
        }
    }
    //显示tag = 11的view
    UIView *tagView = [self.view viewWithTag:11];
    tagView.hidden = NO;
    tagView.superview.hidden = NO;
}

- (void)showTag13{
    //先隐藏所有
    for (UIView *tempView in [self.bgView subviews]) {
        for (UIView *view2 in tempView.subviews) {
            if ([view2 isKindOfClass:[UILabel class]]) {
                view2.hidden = YES;
            }
        }
        if ([tempView isKindOfClass:[UILabel class]]) {
            tempView.hidden = YES;
        }
    }

    //显示tag = 13的view
    UIView *tagView = [self.view viewWithTag:13];
    tagView.hidden = NO;
    tagView.superview.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
