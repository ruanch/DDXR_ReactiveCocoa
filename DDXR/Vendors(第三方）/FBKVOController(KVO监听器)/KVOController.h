/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.

 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

/*
 ====================Excampl====================
 https://github.com/facebook/KVOController
 // create KVO controller instance
 _KVOController = [FBKVOController controllerWithObserver:self];
 
 // handle clock change, including initial value
 [_KVOController observe:clock keyPath:@"date" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew block:^(ClockView *clockView, Clock *clock, NSDictionary *change) {
 
 // update observer with new value
 CLOCK_LAYER(clockView).date = change[NSKeyValueChangeNewKey];
 }];
 }

 */

#import <KVOController/FBKVOController.h>
#import <KVOController/NSObject+FBKVOController.h>
