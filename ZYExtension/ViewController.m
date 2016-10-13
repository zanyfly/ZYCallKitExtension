//
//  ViewController.m
//  ZYExtension
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 ivan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)getContactData:(id)sender {
    //The simulation acquires the data
    NSUserDefaults *defaults =[[NSUserDefaults alloc] initWithSuiteName:@"group.zyextension"];
    
    //TODO: change to right phone number
    [defaults setObject:@{@"+8612345" :@"世界大帅哥"} forKey:@"save_contact_data"];
    [defaults synchronize];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
