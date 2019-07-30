//
//  DYFCountDownButton.m
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

#import "DYFCountDownButton.h"

typedef void(^CountDownStartBlock   )(DYFCountDownButton *_sender, NSInteger startValue);
typedef void(^CountDownUnderwayBlock)(DYFCountDownButton *_sender, NSInteger restValue);
typedef void(^CountDownEndBlock     )(DYFCountDownButton *_sender);

@interface DYFCountDownButton () {
    NSInteger _startValue; // Start Value.
    NSInteger _restValue;  // Rest Value.
}

@property (nonatomic, strong) NSTimer                *timer;

@property (nonatomic, copy  ) CountDownStartBlock    countDownStartBlock;
@property (nonatomic, copy  ) CountDownUnderwayBlock countDownUnderwayBlock;
@property (nonatomic, copy  ) CountDownEndBlock      countDownEndBlock;

@end

@implementation DYFCountDownButton

- (void)configureWithDuration:(NSInteger)duration
               countDownStart:(void (^)(DYFCountDownButton *, NSInteger))countDownStart
            countDownUnderway:(void (^)(DYFCountDownButton *, NSInteger))countDownUnderway
                 countDownEnd:(void (^)(DYFCountDownButton *))countDownEnd {
    self->_startValue           = duration;
    self.countDownStartBlock    = countDownStart;
    self.countDownUnderwayBlock = countDownUnderway;
    self.countDownEndBlock      = countDownEnd;
}

- (void)startCountDown {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    self.enabled   = NO;
    _restValue     = _startValue;
    
    !self.countDownStartBlock ?: self.countDownStartBlock(self, _startValue);
    
    self.timer = [NSTimer timerWithTimeInterval:1
                                         target:self
                                       selector:@selector(refresh)
                                       userInfo:nil
                                        repeats:YES];
    [NSRunLoop.currentRunLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)refresh {
    _restValue--;
    
    !self.countDownUnderwayBlock ?: self.countDownUnderwayBlock(self, _restValue);
    
    if (_restValue == 0) {
        [self.timer invalidate];
        self.timer   = nil;
        
        _restValue   = _startValue;
        !self.countDownEndBlock ?: self.countDownEndBlock(self);
        self.enabled = YES;
    }
}

- (void)endCountDown {
    if (self.timer) {
        [self.timer invalidate];
        self.timer   = nil;
        
        _restValue   = _startValue;
        !self.countDownEndBlock ?: self.countDownEndBlock(self);
        self.enabled = YES;
    }
}

- (void)dealloc {
#ifdef DEBUG
    NSLog(@"%s", __FUNCTION__);
#endif
}

@end
