//
//  DependentComponentPickerViewController.m
//  Pickers
//
//  Created by ldjhust on 15/12/9.
//  Copyright © 2015年 ldj. All rights reserved.
//

#import "DependentComponentPickerViewController.h"

@interface DependentComponentPickerViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) NSArray<NSString *> *keyDatas;
@property (strong, nonatomic) NSDictionary<NSString *, NSArray *> *values;

@property (weak, nonatomic) IBOutlet UIPickerView *dependentPicker;

@end

@implementation DependentComponentPickerViewController

#pragma mark - view lifecycle

- (void)viewDidLoad {
    @autoreleasepool {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"statedictionary" ofType:@"plist"];
        
        self.values = [NSDictionary dictionaryWithContentsOfFile:path];
        self.keyDatas = [self.values allKeys];
    }
}

#pragma mark - picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.keyDatas.count;
    } else {
        NSInteger row = [pickerView selectedRowInComponent:0];
        return self.values[self.keyDatas[row]].count;
    }
}

#pragma mark - picker view delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return self.keyDatas[row];
    } else {
        NSInteger row_key = [pickerView selectedRowInComponent:0];
        return self.values[self.keyDatas[row_key]][row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        [pickerView reloadComponent:1]; // 重新加载邮编选择器
        [pickerView selectRow:0 inComponent:1 animated:true]; // 设置邮编选择器的当前行为0
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return pickerView.bounds.size.width * 3 / 5;
    } else {
        return pickerView.bounds.size.height * 2 / 5;
    }
}

#pragma mark - IBActions

- (IBAction)buttonPressed:(UIButton *)sender {
    @autoreleasepool {
        NSInteger stationRow = [self.dependentPicker selectedRowInComponent:0];
        NSString *station = self.keyDatas[stationRow];
        NSInteger numberRow = [self.dependentPicker selectedRowInComponent:1];
        NSString *number = self.values[station][numberRow];
        NSString *message = [NSString stringWithFormat:@"Station: %@, Number: %@", station, number];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Your Choice" message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Yep, I did" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
