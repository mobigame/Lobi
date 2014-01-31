//
//  KLRInterface.cpp
//  RecTest
//
//  Created by takahashi-kohei on 2014/01/28.
//
//

#include "KLRInterface.h"
#include "KLMVideoCapture.h"
#include "KLMPostVideoViewController.h"
#include "KLMPlayWebViewController.h"
#include "KLMNavigationController.h"
#include "AppController.h"

#define KEY_IDENTIFIER @"sdk_install_id"

void KLRInterface::startCapturing()
{
    static int const offset   = 20;
    static int const wipesize = 100;
    CGFloat width  = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    [KLMVideoCapture sharedInstance].liveWipeStatus    = KLMWipeStatusInCamera;
    [KLMVideoCapture sharedInstance].wipeSquareSize    = wipesize;
    [KLMVideoCapture sharedInstance].wipePositionX     = MAX(width, height) -offset -wipesize;
    [KLMVideoCapture sharedInstance].wipePositionY     = offset;
    [KLMVideoCapture sharedInstance].micEnable         = YES;
    [KLMVideoCapture sharedInstance].micVolume         = 1;
    [KLMVideoCapture sharedInstance].gameSoundVolume   = 1;
    [KLMVideoCapture sharedInstance].hideFaceOnPreview = NO;
    [KLMVideoCapture sharedInstance].preventSpoiler    = NO;
    
    [[KLMVideoCapture sharedInstance] startCapturing];
}

void KLRInterface::stopCapturing()
{
    [[KLMVideoCapture sharedInstance] stopCapturing];
}

void KLRInterface::openPostViewController()
{
    AppController *app = (AppController*)[UIApplication sharedApplication].delegate;
    if (![[KLMVideoCapture sharedInstance] isCapturing] && [[KLMVideoCapture sharedInstance] hasMovie]) {
        [app openPostViewController];
    }
}
void KLRInterface::openWebViewController()
{
    AppController *app = (AppController*)[UIApplication sharedApplication].delegate;
    if (![[KLMVideoCapture sharedInstance] isCapturing]) {
        [app openWebViewController];
    }
}

void KLRInterface::resetAccount()
{
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
}
