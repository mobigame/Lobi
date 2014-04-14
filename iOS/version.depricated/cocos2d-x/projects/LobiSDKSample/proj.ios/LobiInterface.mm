//
//  KLRInterface.cpp
//  RecTest
//
//  Created by takahashi-kohei on 2014/01/28.
//
//

#include "LobiInterface.h"
#include "AppController.h"
#include "CCDirector.h"
#include "KLMVideoCapture.h"
#include "KLMNavigationController.h"
#include "KLMPostVideoViewController.h"
#include "KLMPlayWebViewController.h"
#import "AppController.h"
#import "RootViewController.h"

void LobiInterface::presentProfile()
{
//    [LobiCore presentProfile];
}

void LobiInterface::presentChat()
{
//    [LobiChat presentGroupList];
}

void LobiInterface::presentRanking()
{
//    [LobiRanking presentRanking];
}

void LobiInterface::sendRanking()
{
//    int score1 = (arc4random() % 100000) + 1;
//    [LobiAPI sendRanking:@"devmassive01" score:score1 handler:^(LobiNetworkResponse *res) {
//        NSLog(@"%@", res.dictionary);
//    }];
//    int score2 = (arc4random() % 100000) + 1;
//    [LobiAPI sendRanking:@"devmassive02" score:score2 handler:^(LobiNetworkResponse *res) {
//        NSLog(@"%@", res.dictionary);
//    }];
//    int score3 = (arc4random() % 100000) + 1;
//    [LobiAPI sendRanking:@"devmassive03" score:score3 handler:^(LobiNetworkResponse *res) {
//        NSLog(@"%@", res.dictionary);
//    }];
//    int score4 = (arc4random() % 100000) + 1;
//    [LobiAPI sendRanking:@"devmassive04" score:score4 handler:^(LobiNetworkResponse *res) {
//        NSLog(@"%@", res.dictionary);
//    }];
//    
//    NSString *message = [NSString stringWithFormat:@"devmassive01 : %d点とった！\ndevmassive02 : %d点とった！\ndevmassive03 : %d点とった！\ndevmassive04 : %d点とった！", score1, score2, score3, score4];
//    
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:message
//                               delegate:nil
//                      cancelButtonTitle:nil
//                      otherButtonTitles:@"OK", nil] show];
}

void LobiInterface::recStart()
{
    static int const offset   = 8;
    static int const wipesize = 100;
    [KLMVideoCapture sharedInstance].liveWipeStatus  = KLMWipeStatusInCamera;
    [KLMVideoCapture sharedInstance].wipeSquareSize  = wipesize;
    [KLMVideoCapture sharedInstance].wipePositionX   = offset;
    [KLMVideoCapture sharedInstance].wipePositionY   = offset;
    [KLMVideoCapture sharedInstance].micEnable       = YES;
    [KLMVideoCapture sharedInstance].micVolume       = 1;
    [KLMVideoCapture sharedInstance].gameSoundVolume = 1;
    [KLMVideoCapture sharedInstance].hideFaceOnPreview = NO;
    [KLMVideoCapture sharedInstance].preventSpoiler    = NO;
    [KLMVideoCapture sharedInstance].capturePerFrame   = 3;
    [[KLMVideoCapture sharedInstance] startCapturing];
}

void LobiInterface::wipePostion(float x, float y)
{
    [KLMVideoCapture sharedInstance].wipePositionX   = x - 50;
    [KLMVideoCapture sharedInstance].wipePositionY   = 568 - y - 50;
}

void LobiInterface::recStop()
{
    [[KLMVideoCapture sharedInstance] stopCapturing];
}

void LobiInterface::presentShare()
{
    NSString *postTitle = @"プレイ動画をシェアします！";
    NSString *postDescriotion = @"神懸ったこの華麗なプレイ。やばい。";
    KLMPostVideoViewController *vc = [[KLMPostVideoViewController alloc] init];
    KLMNavigationController *nc = [[KLMNavigationController alloc] initWithRootViewController:vc];
    vc.postTitle = postTitle;
    vc.postDescriotion = postDescriotion;
    vc.postScore = 100;
    vc.completionBlock = ^{
        cocos2d::CCDirector::sharedDirector()->startAnimation();
    };
    AppController *app = [UIApplication sharedApplication].delegate;
    [app.viewController presentViewController:nc animated:YES completion:^{
        cocos2d::CCDirector::sharedDirector()->stopAnimation();
    }];
//    [KLMVideoCapture presentLobiPostWithTitle:postTitle
//                       postDescrition:postDescriotion
//                            postScore:100
//                         postCategory:@""
//                       prepareHandler:^{
//                           cocos2d::CCDirector::sharedDirector()->stopAnimation();
//                       } afterHandler:^{
//                           cocos2d::CCDirector::sharedDirector()->startAnimation();
//                       }];
}
