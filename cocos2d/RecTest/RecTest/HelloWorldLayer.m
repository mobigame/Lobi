//
//  HelloWorldLayer.m
//  RecTest
//
//  Created by takahashi-kohei on 2014/01/28.
//  Copyright 面白法人カヤック 2014年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

#import "AppDelegate.h"
#import "KLMPostVideoViewController.h"
#import "KLMPlayWebViewController.h"
#import "KLMNavigationController.h"
#import "KLMVideoCapture.h"

#define KEY_IDENTIFIER @"sdk_install_id"

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
	if((self = [super init])) {
		
        self.touchEnabled = YES;
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Lobi Rec SDK" fontName:@"Marker Felt" fontSize:64];
		CGSize size = [[CCDirector sharedDirector] winSize];
		label.position =  ccp( size.width /2 , size.height/2 );
		[self addChild:label];
		[CCMenuItemFont setFontSize:28];
		
		CCMenuItem *record = [CCMenuItemFont itemWithString:@"Record" block:^(id sender) {

            static int const offset   = 20;
            static int const wipesize = 100;
            CGFloat width  = [UIScreen mainScreen].bounds.size.width;
            CGFloat height = [UIScreen mainScreen].bounds.size.height;
            [KLMVideoCapture sharedInstance].liveWipeStatus  = KLMWipeStatusInCamera;
            [KLMVideoCapture sharedInstance].wipeSquareSize  = wipesize;
            [KLMVideoCapture sharedInstance].wipePositionX   = MAX(width, height) -offset -wipesize;
            [KLMVideoCapture sharedInstance].wipePositionY   = offset;
            [KLMVideoCapture sharedInstance].micEnable       = YES;
            [KLMVideoCapture sharedInstance].micVolume       = 1;
            [KLMVideoCapture sharedInstance].gameSoundVolume = 1;
            [KLMVideoCapture sharedInstance].hideFaceOnPreview = NO;
            [KLMVideoCapture sharedInstance].preventSpoiler    = NO;

			[[KLMVideoCapture sharedInstance] startCapturing];
		}];
		
		CCMenuItem *stop = [CCMenuItemFont itemWithString:@"Stop" block:^(id sender) {
			[[KLMVideoCapture sharedInstance] stopCapturing];
		}];

        CCMenuItem *share = [CCMenuItemFont itemWithString:@"Share" block:^(id sender) {
            if (![[KLMVideoCapture sharedInstance] isCapturing] && [[KLMVideoCapture sharedInstance] hasMovie])
            {
                KLMPostVideoViewController *vc = [[[KLMPostVideoViewController alloc] init] autorelease];
                vc.postTitle = @"プレイ動画をシェアします！";
                vc.postDescriotion = @"神懸ったこの華麗なプレイ。やばい。";
                vc.postScore = 100;
                vc.postCategory = @"";
                vc.hidePostAnotation = NO;
                KLMNavigationController *nc = [[[KLMNavigationController alloc] initWithRootViewController:vc] autorelease];
                AppController *app = (AppController*)[UIApplication sharedApplication].delegate;
                [app.navController presentViewController:nc animated:YES completion:^{}];
            }
		}];

        CCMenuItem *web = [CCMenuItemFont itemWithString:@"Web" block:^(id sender) {
            if (![[KLMVideoCapture sharedInstance] isCapturing]) {
                KLMPlayWebViewController *vc = [[[KLMPlayWebViewController alloc] init] autorelease];
                KLMNavigationController *nc = [[[KLMNavigationController alloc] initWithRootViewController:vc] autorelease];
                AppController *app = (AppController*)[UIApplication sharedApplication].delegate;
                [app.navController presentViewController:nc animated:YES completion:^{}];
            }
		}];

		
		CCMenu *menu = [CCMenu menuWithItems:record, stop, share, web, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		[self addChild:menu];

        CCMenuItem *reset = [CCMenuItemFont itemWithString:@"ResetAccount" block:^(id sender) {
            NSString *const appName = [[NSBundle mainBundle] bundleIdentifier];
            NSString *const KLMServiceIdentifier = [NSString stringWithFormat:@"com.kayac.sdk.%@",appName];
            {// 削除
                NSDictionary *query = @{
                    (__bridge id)kSecClass:(__bridge id)kSecClassGenericPassword
                };
                if (SecItemDelete((__bridge CFDictionaryRef)query) == noErr) {
                    NSLog(@"delete success");
                }
                else {
                    NSLog(@"delete fail");
                }
            }
            
            {
                NSLog(@"identifier:%@",KLMServiceIdentifier);
                NSDictionary *query = @{
                    (__bridge id)kSecClass       : (__bridge id)kSecClassGenericPassword,
                    (__bridge id)kSecAttrGeneric : (id)[KEY_IDENTIFIER dataUsingEncoding:NSUTF8StringEncoding],
                    (__bridge id)kSecAttrService : (id)KLMServiceIdentifier,
                    (__bridge id)kSecReturnData  : (id)kCFBooleanTrue,
                };
                CFDataRef d = nil;
                if (SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef*)&d) == noErr) {
                    NSData *fetchedData = (__bridge NSData*)d;
                    NSLog(@"fetch success : %@", [fetchedData description]);
                }
                else{
                    NSLog(@"fetch fail");
                }
            }
		}];
        
		CCMenu *resetMenu = [CCMenu menuWithItems:reset, nil];
		[resetMenu setPosition:ccp(size.width - 100, 20)];
		[self addChild:resetMenu];

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

	_emitter = [[[CCParticleSystemQuad alloc] initWithTotalParticles:300] autorelease];

	_emitter.texture = [[CCTextureCache sharedTextureCache] addImage: @"star.png"];
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
	_emitter.startSize = 30.0f;
	_emitter.startSizeVar = 00.0f;
	_emitter.endSize = kCCParticleStartSizeEqualToEndSize;
	_emitter.emissionRate = _emitter.totalParticles/_emitter.life;
	_emitter.blendAdditive = NO;

    [self addChild:_emitter];
    [self setEmitterPosition];
}
@end
