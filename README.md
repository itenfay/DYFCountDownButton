[如果此项目能帮助到你，就请你给一颗星。谢谢！(If this project can help you, please give it a star. Thanks!)](https://github.com/dgynfi/DYFCountDownButton)

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](LICENSE)&nbsp;

## DYFCountDownButton

&emsp; 一个倒计时按钮，操作简单好用。(A countdown button for iOS, the operation is simple and easy to use.)

## Group (ID:614799921)

<div align=left>
&emsp; <img src="https://github.com/dgynfi/DYFCountDownButton/raw/master/images/g614799921.jpg" width="30%" />
</div>

## Preview

<div align=left>
&emsp; <img src="https://github.com/dgynfi/DYFCountDownButton/raw/master/images/CountDownButtonPreview.gif" width="30%" />
</div>

## Usage

- 实例化与布局

&emsp; 直接在 storyboard 或在 xib 绘制，设置约束，省去手工代码。

- 配置

```ObjC
- (void)configureCountDownButton {
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
}
```

- 开始倒计时

```ObjC
- (IBAction)getMsgVerifiedCode:(id)sender {
    [self.m_button startCountDown];
}
```

- 结束倒计时

&emsp; 当任务失败或者你需要提前终止倒计时，调用此方法。(When the task fails or you need to terminate the countdown ahead of time, you call this method.)

```ObjC
- (IBAction)endCountDown:(id)sender {
    [self.m_button endCountDown];
}
```

## Code Sample

- [Code Sample Portal](https://github.com/dgynfi/DYFCountDownButton/blob/master/Basic%20Files/ViewController.m)
