//
//  ViewController.m
//  DebugDescription
//
//  Created by 曾国锐 on 2017/8/4.
//  Copyright © 2017年 曾国锐. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "NSObject+DebugDescription.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Model *model = [[Model alloc] init];
    model.name = @"aaa";
    model.age = @"11";
    model.height = @"155";
    
    
    NSLog(@"%@", model);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
