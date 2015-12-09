//
//  DatePicerViewController.m
//  Pickers
//
//  Created by ldjhust on 15/12/9.
//  Copyright © 2015年 ldj. All rights reserved.
//

#import "DatePicerViewController.h"

@interface DatePicerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation DatePicerViewController

#pragma mark - view lifecycle

- (void)viewDidLoad {
    // 每次最开始都显示当前系统时间
    NSDate *date = [NSDate date];
    [self.datePicker setDate:date];
}

#pragma mark - IBActions

- (IBAction)buttonPressed:(UIButton *)sender {
    @autoreleasepool {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        formatter.dateFormat = @"yyyy-MM-dd hh:mm:ss";
        NSString *message = [formatter stringFromDate:self.datePicker.date];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Date and Time Selected" message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"That's so true" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
