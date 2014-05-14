//
//  HelloWorldLayer.m
//  LobiSDKSample
//
//  Created by takahashi-kohei on 2014/03/26.
//  Copyright 面白法人カヤック 2014年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import <LobiCore/LobiCore.h>
#import <LobiRec/LobiRec.h>
#import <LobiChat/LobiChat.h>
#import <LobiCore/LobiAPI.h>
#import <LobiRanking/LobiRanking.h>
#import "SimpleAudioEngine.h"


#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init]) ) {
		
        self.touchEnabled = YES;

		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Lobi SDK" fontName:@"Arial" fontSize:32];
		CGSize size = [[CCDirector sharedDirector] winSize];
		label.position =  ccp( size.width /2 , size.height * 3/4);
		[self addChild: label];
		
		[CCMenuItemFont setFontSize:16];
		[CCMenuItemFont setFontName:@"Arial"];

        {
            CCMenuItem *profile = [CCMenuItemFont itemWithString:@"プロフィール表示" block:^(id sender) {
                [LobiCore presentProfile];
            }];
            
            CCMenuItem *chatGroup = [CCMenuItemFont itemWithString:@"チャットグループ表示" block:^(id sender) {
                [LobiChat presentGroupList];
            }];
            
            CCMenu *menu = [CCMenu menuWithItems:profile, chatGroup, nil];
            [menu alignItemsHorizontallyWithPadding:20];
            [menu setPosition:ccp(size.width/2, size.height/2)];
            [self addChild:menu];
        }

		{
            CCMenuItem *rankingList = [CCMenuItemFont itemWithString:@"ランキング表示" block:^(id sender) {
                //[LobiRanking presentRanking];
                [LobiAPI getRanking:@"devmassive01" type:KLRRankingRangeAll origin:KLRRankingCursorOriginTop cursor:1 limit:10 handler:^(LobiNetworkResponse *res) {
                    NSLog(@"Response:%@",res);
                }];
            }];
            
            CCMenuItem *sendRanking = [CCMenuItemFont itemWithString:@"ランキング送信" block:^(id sender) {
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

            }];
            
            CCMenu *menu = [CCMenu menuWithItems:rankingList, sendRanking, nil];
            [menu alignItemsHorizontallyWithPadding:20];
            [menu setPosition:ccp(size.width/2, size.height/2 - 50)];
            [self addChild:menu];
        }
        
        {
            CCMenuItem *recStart = [CCMenuItemFont itemWithString:@"録画開始" block:^(id sender) {
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
                [LobiRec sharedInstance].capturePerFrame   = 1;
                [LobiRec  startCapturing];
            }];
            
            CCMenuItem *recStop = [CCMenuItemFont itemWithString:@"録画停止" block:^(id sender) {
                [LobiRec stopCapturing];
            }];
            
            CCMenuItem *postVideo = [CCMenuItemFont itemWithString:@"動画シェア" block:^(id sender) {
                NSString *postTitle = @"プレイ動画をシェアします！";
                NSString *postDescriotion = @"神懸ったこの華麗なプレイ。やばい。";
                [LobiRec presentLobiPostWithTitle:postTitle
                                   postDescrition:postDescriotion
                                        postScore:100
                                     postCategory:@""
                                   prepareHandler:^{
                                       [[CCDirector sharedDirector] stopAnimation];
                                   } afterHandler:^{
                                       [[CCDirector sharedDirector] startAnimation];
                                   }];
            }];
            CCMenu *menu = [CCMenu menuWithItems:recStart, recStop, postVideo, nil];
            [menu alignItemsHorizontallyWithPadding:20];
            [menu setPosition:ccp(size.width/2, size.height/2 - 100)];
            [self addChild:menu];
        }

        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"track.mp3" loop:YES];
		[self scheduleUpdate];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	[self ccTouchesEnded:touches withEvent:event];
}

- (void)ccTouchesMoved:(NSSet*)touches withEvent:(UIEvent *)event
{
	[self ccTouchesEnded:touches withEvent:event];
}

- (void)ccTouchesEnded:(NSSet*)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
	CGPoint pos = CGPointZero;
	_emitter.position = ccpSub(convertedLocation, pos);
}

-(void) setEmitterPosition
{
	if( CGPointEqualToPoint( _emitter.sourcePosition, CGPointZero ) )
		_emitter.position = ccp(200, 70);
}

-(void) onEnter
{
	[super onEnter];
    
	_emitter = [[[CCParticleSystemQuad alloc] initWithTotalParticles:100] autorelease];
    
	_emitter.texture = [[CCTextureCache sharedTextureCache] addImage: @"nuko.png"];
	_emitter.duration = kCCParticleDurationInfinity;
	_emitter.emitterMode = kCCParticleModeGravity;
	_emitter.gravity = CGPointZero;
	_emitter.speed = 160;
	_emitter.speedVar = 20;
	_emitter.radialAccel = -120;
	_emitter.radialAccelVar = 0;
	_emitter.tangentialAccel = 30;
	_emitter.tangentialAccelVar = 0;
	_emitter.position = ccp(160,240);
	_emitter.posVar = CGPointZero;
	_emitter.angle = 90;
	_emitter.angleVar = 360;
	_emitter.life = 3;
	_emitter.lifeVar = 1;
	_emitter.startSpin = 0;
	_emitter.startSpinVar = 0;
	_emitter.endSpin = 0;
	_emitter.endSpinVar = 2000;
	ccColor4F startColor = {0.5f, 0.5f, 0.5f, 1.0f};
	_emitter.startColor = startColor;
	ccColor4F startColorVar = {0.5f, 0.5f, 0.5f, 1.0f};
	_emitter.startColorVar = startColorVar;
	ccColor4F endColor = {0.1f, 0.1f, 0.1f, 0.2f};
	_emitter.endColor = endColor;
	ccColor4F endColorVar = {0.1f, 0.1f, 0.1f, 0.2f};
	_emitter.endColorVar = endColorVar;
	_emitter.startSize = 120.0f;
	_emitter.startSizeVar = 00.0f;
	_emitter.endSize = kCCParticleStartSizeEqualToEndSize;
	_emitter.emissionRate = _emitter.totalParticles/_emitter.life;
	_emitter.blendAdditive = NO;
    _emitter.zOrder = -1;

    [self addChild:_emitter];
    [self setEmitterPosition];
}

- (void)hoge
{
    [LobiRanking presentRanking];
}


@end
