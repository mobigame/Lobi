//
//  HelloWorldLayer.h
//  LobiSDKSample
//
//  Created by takahashi-kohei on 2014/03/26.
//  Copyright 面白法人カヤック 2014年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CCSprite *status;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
@property (readwrite,retain) CCParticleSystem *emitter;

@end
