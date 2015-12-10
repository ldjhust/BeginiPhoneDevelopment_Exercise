//
//  DoubleComponentPickerViewController.m
//  Pickers
//
//  Created by ldjhust on 15/12/9.
//  Copyright © 2015年 ldj. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"

@interface DoubleComponentPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *leftPicker;
@property (strong, nonatomic) NSArray<NSString *> *leftData;
@property (strong, nonatomic) NSArray<NSString *> *rightData;

@end

@implementation DoubleComponentPickerViewController

#pragma mark - view lifecycle

- (void)viewDidLoad {
    self.leftData = @[@"Ham", @"Turkey", @"Peanut Butter", @"Tuna Salad", @"Chicken Salad", @"Roast Beaf", @"Vegemite"];
    self.rightData = @[@"White", @"Whole Wheat", @"Rye", @"Sourdough", @"Seven Grain"];
}

#pragma mark - picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [self.leftData count];
    } else {
        return [self.rightData count];
    }
}

#pragma mark - picker view delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return self.leftData[row];
    } else {
        return self.rightData[row];
    }
}

#pragma mark - IBActions

- (IBAction)buttonPressed:(UIButton *)sender {
    NSInteger leftRow = [self.leftPicker selectedRowInComponent:0];
    NSInteger rightRow = [self.leftPicker selectedRowInComponent:1];
    NSString *title = [NSString stringWithFormat:@"Left: %@, Right: %@", self.leftData[leftRow], self.rightData[rightRow]];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:@"Thank for choose!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"You are welcome" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
