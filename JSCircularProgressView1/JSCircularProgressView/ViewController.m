//
//  ViewController.m
//  JSCircularProgressView
//
//  Created by Eric Wang on 14/10/30.
//  Copyright (c) 2014年 LinkMob. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.progressView = [[JSCircularProgressView alloc] initWithFrame:CGRectMake(20, 200, 80, 80)];
    self.progressView.label.text = @"GIF";
    [self.view addSubview:self.progressView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(progressChange) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)progressChange {
    
    self.progressView.progress += 0.01;
    
    if (self.progressView.progress > 1.0f)
    {
        self.progressView.progress = 0.0f;
    }
}

@end
