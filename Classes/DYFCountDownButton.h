//
//  DYFCountDownButton.h
//
//  Created by dyf on 2018/3/27.
//  Copyright © 2018 dyf. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import <UIKit/UIKit.h>

@interface DYFCountDownButton : UIButton

/**
 Configures a `DYFCountDownButton` button.
 
 @param duration The time of countdown
 @param countDownStart At the start of the countdown, it is called and cannot be NULL.
 @param countDownUnderway At the time of countdown, it is called and cannot be NULL.
 @param countDownEnd At the end of countdown, it is called and cannot be NULL.
 */
- (void)configureWithDuration:(NSInteger)duration
               countDownStart:(void(^)(DYFCountDownButton *_sender, NSInteger startValue))countDownStart
            countDownUnderway:(void(^)(DYFCountDownButton *_sender, NSInteger restValue))countDownUnderway
                 countDownEnd:(void(^)(DYFCountDownButton *_sender))countDownEnd;

/**
 The countdown starts. when the input text is invalid, you need to tip user and can't call it.
 */
- (void)startCountDown;

/**
 The countdown ends. when the task fails or you need to terminate the countdown ahead of time, you call it.
 */
- (void)endCountDown;

@end
