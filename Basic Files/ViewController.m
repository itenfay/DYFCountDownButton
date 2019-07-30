//
//  ViewController.m
//
//  Created by dyf on 2018/3/27.
//  Copyright © 2018 dyf. All rights reserved.
//

#import "ViewController.h"
#import "DYFCountDownButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet DYFCountDownButton *m_button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)getMsgVerifiedCode:(id)sender {
    [self.m_button configureWithDuration:20 countDownStart:^(DYFCountDownButton *_sender, NSInteger startValue) {
        
        NSString *title = [NSString stringWithFormat:@"%zis后重新发送", startValue];
        [_sender setTitle:title forState:UIControlStateNormal];
        
    } countDownUnderway:^(DYFCountDownButton *_sender, NSInteger restValue) {
        
        NSString *title = [NSString stringWithFormat:@"%zis后重新发送", restValue];
        [_sender setTitle:title forState:UIControlStateNormal];
        
    } countDownEnd:^(DYFCountDownButton *_sender) {
        
        NSString *title = [NSString stringWithFormat:@"获取验证码"];
        [_sender setTitle:title forState:UIControlStateNormal];
        
    }];
    
    [self.m_button startCountDown];
}

- (IBAction)endCountDown:(id)sender {
    [self.m_button endCountDown];
}

@end
