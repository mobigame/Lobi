//
//  KLMPlayWebViewController.h
//  LobiRankingSample
//
//  Created by takahashi-kohei on 2013/12/20.
//  Copyright (c) 2013年 KAMEDAkyosuke. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KLMPlayWebDefaultView)
{
    KLMPlayWebViewNone    = -1,
    KLMPlayWebViewProfile = 0,
    KLMPlayWebViewList,
    KLMPlayWebViewHelp,
};

@interface KLMPlayWebViewController : UIViewController
@property (nonatomic, copy)   void(^completionBlock)(void);
@property (nonatomic, assign) KLMPlayWebDefaultView defaultView;
@end
