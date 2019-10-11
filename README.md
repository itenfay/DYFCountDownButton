[如果你觉得能帮助到你，请给一颗小星星。谢谢！(If you think it can help you, please give it a star. Thanks!)](https://github.com/dgynfi/DYFCountDownButton)

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](LICENSE)&nbsp;

## DYFCountDownButton

&emsp; 一个倒计时按钮，操作简单好用。(A countdown button for iOS, the operation is simple and easy to use.)

## 技术交流群(群号:155353383) 

- 欢迎加入技术交流群，一起探讨技术问题。

<div align=left>
&emsp; <img src="https://github.com/dgynfi/DYFCountDownButton/raw/master/images/qq155353383.jpg" width="20%" />
</div>

## 效果图

<div align=left>
&emsp; <img src="https://github.com/dgynfi/DYFCountDownButton/raw/master/images/CountDownButtonPreview.gif" width="30%" />
</div>

## 使用说明

1. 实例化与布局

&emsp; 直接在 storyboard 或在 xib 绘制，设置约束，省去手工代码。

2. 配置

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

3. 开始倒计时

```ObjC
- (IBAction)getMsgVerifiedCode:(id)sender {
    [self.m_button startCountDown];
}
```

4. 结束倒计时

&emsp; 当任务失败或者你需要提前终止倒计时，调用此方法。(When the task fails or you need to terminate the countdown ahead of time, you call this method.)
  
```ObjC
- (IBAction)endCountDown:(id)sender {
    [self.m_button endCountDown];
}
```

## Sample Codes

- [Sample Codes Gateway](https://github.com/dgynfi/DYFCountDownButton/blob/master/Basic%20Files/ViewController.m)
