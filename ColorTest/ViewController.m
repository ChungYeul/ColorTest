//
//  ViewController.m
//  ColorTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)onColorSliderChanged:(id)sender;
@end

@implementation ViewController

- (IBAction)powerOnOff:(id)sender {
    BOOL isOn = ((UISwitch *)sender).on;
    
    self.redSlider.enabled = isOn;
    self.greenSlider.enabled = isOn;
    self.blueSlider.enabled = isOn;
    
    if (isOn) {
        // 액티비티 인디케이터 시작
        [self.activityIndicator startAnimating];
        
        // 1초 뒤에 현재 색상으로 변경
        [self performSelector:@selector(onColorSliderChanged:) withObject:nil afterDelay:1.0f];
    }
    else {
        // OFF 상태면 회색 상태로 변경
        self.colorView.backgroundColor = [UIColor grayColor];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    // 슬라이더의 초기값으로 색상 설정
    [self onColorSliderChanged:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onColorSliderChanged:(id)sender {
    // 인디케이터가 동작중이면 중지
    if ([self.activityIndicator isAnimating]) {
        [self.activityIndicator stopAnimating];
    }
    self.colorView.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1.0f];
}
@end
