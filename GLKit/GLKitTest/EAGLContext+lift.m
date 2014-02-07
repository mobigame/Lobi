//
//  EAGLContext+lift.m
//  GLKitTest
//
//  Created by takahashi-kohei on 2014/01/28.
//  Copyright (c) 2014年 RaftRiders Inc. All rights reserved.
//

#import "EAGLContext+lift.h"
#import "KLMVideoCapture.h"

#import <objc/runtime.h>

@implementation EAGLContext(lift)

+ (void)load
{
//    // initWithContentsOfURL:error:
//    {
//        Method methodLifted = class_getInstanceMethod([EAGLContext class], @selector(presentRenderbuffer:));
//        Method methodReassign = class_getInstanceMethod([EAGLContext class], @selector(klm_swzl_presentRenderbuffer));
//        method_exchangeImplementations(methodLifted, methodReassign);
//    }
}

-(void)klm_swzl_presentRenderbuffer
{
//    Method methodLifted = class_getInstanceMethod([EAGLContext class], @selector(presentRenderbuffer:));
//    Method methodReassign = class_getInstanceMethod([EAGLContext class], @selector(klm_swzl_presentRenderbuffer));
//    method_exchangeImplementations(methodReassign, methodLifted);
//
//    [[KLMVideoCapture sharedInstance] presentRenderbuffer];
//
//    method_exchangeImplementations(methodLifted, methodReassign);
}
@end
