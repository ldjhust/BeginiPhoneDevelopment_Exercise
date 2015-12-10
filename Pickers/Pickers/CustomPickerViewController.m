//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by ldjhust on 15/12/9.
//  Copyright © 2015年 ldj. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "CustomPickerViewController.h"

@interface CustomPickerViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSArray<UIImage *> *images;
@property (assign, nonatomic) SystemSoundID winSoundID;
@property (assign, nonatomic) SystemSoundID crunchSoundID;

@property (weak, nonatomic) IBOutlet UIPickerView *gamePicker;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UIButton *button;

- (void)showButon;
- (void)playWinSound;

@end

@implementation CustomPickerViewController

#pragma mark - view lifecycle

- (void)viewDidLoad {
    // 初始化
    self.images = @[[UIImage imageNamed:@"seven"],
                    [UIImage imageNamed:@"bar"],
                    [UIImage imageNamed:@"crown"],
                    [UIImage imageNamed:@"cherry"],
                    [UIImage imageNamed:@"lemon"],
                    [UIImage imageNamed:@"apple"]];
    
    // 配置
    self.winLabel.text = @" ";
}

#pragma mark - picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.images.count;
}

#pragma mark - picker view delegate

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    @autoreleasepool {
        UIImage *image = self.images[row];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        return imageView;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 64;
}

#pragma mark - private methods

- (void)showButon {
    self.button.hidden = NO;
}

- (void)playWinSound {
    if (_winSoundID == 0) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &_winSoundID);
    }
    
    AudioServicesPlaySystemSound(_winSoundID);
    self.winLabel.text = @"WINNER!";
    // 1.5s之后执行showButton
    [self performSelector:@selector(showButon) withObject:nil afterDelay:1.5];
}

#pragma mark - IBActions

- (IBAction)spin:(UIButton *)sender {
    BOOL win = NO;
    int numInRow = 1;
    int lastVal = -1;
    
    for (int i = 0; i < 5; i++) {
        int newValue = arc4random_uniform((uint)self.images.count);
        
        if (newValue == lastVal) {
            numInRow++;
        } else {
            numInRow = 1;
        }
        
        lastVal = newValue;
        [self.gamePicker selectRow:newValue inComponent:i animated:YES];
        [self.gamePicker reloadComponent:i];
        if (numInRow >= 3) {
            win = YES;
        }
    }
    
    if (_crunchSoundID == 0) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"crunch" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &_crunchSoundID);
    }
    
    AudioServicesPlaySystemSound(_crunchSoundID);
    
    if (win) {
        [self performSelector:@selector(playWinSound) withObject:nil afterDelay:.5];
    } else {
        [self performSelector:@selector(showButon) withObject:nil afterDelay:.5];
    }
    
    self.button.hidden = YES;
    self.winLabel.text = @" ";
}
@end
