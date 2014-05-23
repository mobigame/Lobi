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

#import <LobiCore/LobiCore.h>
#import <LobiChat/LobiChat.h>
#import <LobiRanking/LobiRanking.h>
#import <LobiRec/LobiRec.h>

void LobiInterface::presentProfile()
{
    [LobiCore presentProfile];
}

void LobiInterface::presentChat()
{
    [LobiChat presentGroupList];
}

void LobiInterface::presentRanking()
{
    [LobiRanking presentRanking];
}

void LobiInterface::sendRanking()
{
    int score1 = (arc4random() % 100000) + 1;
    [LobiAPI sendRanking:@"devmassive01" score:score1 handler:^(LobiNetworkResponse *res) {
        NSLog(@"%@", res.dictionary);
    }];
    int score2 = (arc4random() % 100000) + 1;
    [LobiAPI sendRanking:@"devmassive02" score:score2 handler:^(LobiNetworkResponse *res) {
        NSLog(@"%@", res.dictionary);
    }];
    int score3 = (arc4random() % 100000) + 1;
    [LobiAPI sendRanking:@"devmassive03" score:score3 handler:^(LobiNetworkResponse *res) {
        NSLog(@"%@", res.dictionary);
    }];
    int score4 = (arc4random() % 100000) + 1;
    [LobiAPI sendRanking:@"devmassive04" score:score4 handler:^(LobiNetworkResponse *res) {
        NSLog(@"%@", res.dictionary);
    }];
    
    NSString *message = [NSString stringWithFormat:@"devmassive01 : %d点とった！\ndevmassive02 : %d点とった！\ndevmassive03 : %d点とった！\ndevmassive04 : %d点とった！", score1, score2, score3, score4];
    
    [[[UIAlertView alloc] initWithTitle:nil
                                message:message
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:@"OK", nil] show];
}

void LobiInterface::recStart()
{
    static int const offset   = 8;
    static int const wipesize = 100;
    [LobiRec sharedInstance].liveWipeStatus  = KLVWipeStatusInCamera;
    [LobiRec sharedInstance].wipeSquareSize  = wipesize;
    [LobiRec sharedInstance].wipePositionX   = offset;
    [LobiRec sharedInstance].wipePositionY   = offset;
    [LobiRec sharedInstance].micEnable       = YES;
    [LobiRec sharedInstance].micVolume       = 1;
    [LobiRec sharedInstance].gameSoundVolume = 1;
    [LobiRec sharedInstance].hideFaceOnPreview = NO;
    [LobiRec sharedInstance].preventSpoiler    = NO;
    [LobiRec sharedInstance].capturePerFrame   = 3;
    [LobiRec  startCapturing];
}

void LobiInterface::wipePostion(float x, float y)
{
    [LobiRec sharedInstance].wipePositionX   = x - 50;
    [LobiRec sharedInstance].wipePositionY   = 568 - y - 50;
}

void LobiInterface::recStop()
{
    [LobiRec stopCapturing];
}

void LobiInterface::recPause()
{
    [LobiRec pause];
}

void LobiInterface::recResume()
{
    [LobiRec resume];
}

void LobiInterface::presentShare()
{
    NSString *postTitle = @"プレイ動画をシェアします！";
    NSString *postDescriotion = @"神懸ったこの華麗なプレイ。やばい。";
    [LobiRec presentLobiPostWithTitle:postTitle
                       postDescrition:postDescriotion
                            postScore:100
                         postCategory:@""
                       prepareHandler:^{
                           cocos2d::CCDirector::sharedDirector()->stopAnimation();
                       } afterHandler:^{
                           cocos2d::CCDirector::sharedDirector()->startAnimation();
                       }];
}


bool LobiInterface::isRecording()
{
    return [LobiRec sharedInstance].isCapturing;
}

bool LobiInterface::isPause()
{
    return [LobiRec isPause];
}
