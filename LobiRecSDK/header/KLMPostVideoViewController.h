//
//  KLMPostVideoViewController.h
//  LobiRankingSample
//
//  Created by takahashi-kohei on 2013/12/11.
//  Copyright (c) 2013年 KAMEDAkyosuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLMPostVideoViewController : UIViewController

@property (nonatomic, copy) NSString *postTitle;
@property (nonatomic, copy) NSString *postDescriotion;
@property (nonatomic, assign) int64_t postScore;
@property (nonatomic, assign) NSInteger postCategory;

/**
 *  動画投稿後のポップアップメッセージを表示しないようにします。
 */
@property (nonatomic, assign) BOOL hidePostAnotation;
@end
