//
//  SingleComponentPickerViewController.m
//  Pickers
//
//  Created by ldjhust on 15/12/9.
//  Copyright © 2015年 ldj. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@interface SingleComponentPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong, nonatomic) NSArray<NSString *> *characterNames;

@end

@implementation SingleComponentPickerViewController

#pragma mark - view lifecycle

- (void)viewDidLoad {
    self.characterNames = @[@"Luke", @"Leia", @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando"];
}

#pragma mark - Picker view datasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.characterNames count];
}

#pragma mark - Picker view delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.characterNames[row];
}

#pragma mark - IBActions

- (IBAction)buttonPressed:(UIButton *)sender {
    @autoreleasepool {
        NSUInteger row = [self.singlePicker selectedRowInComponent:0];
        NSString *selected = self.characterNames[row];
        NSString *title = [NSString stringWithFormat:@"You selected %@!", selected];
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:@"Thank you for choose." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"You are welcome!" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
@end
