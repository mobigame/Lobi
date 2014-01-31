//
//  HelloWorldLayer.h
//  RecTest
//
//  Created by takahashi-kohei on 2014/01/28.
//  Copyright 面白法人カヤック 2014年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@class Emitter;

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
}

@property (readwrite,retain) CCParticleSystem *emitter;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
