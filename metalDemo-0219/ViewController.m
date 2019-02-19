//
//  ViewController.m
//  metalDemo-0219
//
//  Created by 王洪飞 on 2019/2/19.
//  Copyright © 2019 王洪飞. All rights reserved.
//

#import "ViewController.h"
#import "YLZMetalView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YLZMetalView *metalView = [[YLZMetalView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    [self.view addSubview:metalView];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
