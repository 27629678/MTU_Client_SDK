//
//  ViewController.m
//  TestDemo
//
//  Created by H-YXH on 3/18/15.
//  Copyright (c) 2015 migo Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "MTUApi.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [MTUApi registerApp:@"test_util_client"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)installTestAction:(id)sender {
    BOOL isInsatll = [MTUApi isMailMasterInstalled];
    NSString* statusStr = @"Installed";
    if (!isInsatll) {
        statusStr = @"Not Installed";
    }
    
    UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"Install Check"
                                                 message:statusStr
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil, nil];
    [av show];
}

- (IBAction)apiSupportTestAction:(id)sender {
    BOOL isInsatll = [MTUApi isMailMasterInstalled];
    NSString* statusStr = @"Support";
    if (!isInsatll) {
        statusStr = @"Not Support";
    }
    
    UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"Api Support Check"
                                                 message:statusStr
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil, nil];
    [av show];
}

- (IBAction)openMailMasterAction:(id)sender {
//    [MTUApi openMailMaster];
    
    
    MTUCurrentConfigReq* request = [[MTUCurrentConfigReq alloc] init];
    [MTUApi sendReq:request];
}
@end
