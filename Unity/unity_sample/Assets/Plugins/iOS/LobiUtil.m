#import <UIKit/UIKit.h>

#define KEY_IDENTIFIER     @"sdk_install_id"
void KLM_util_clear_user_()
{
    NSString *const appName = [[NSBundle mainBundle] bundleIdentifier];
    NSString *const KLMServiceIdentifier = [NSString stringWithFormat:@"com.kayac.sdk.%@",appName];
    {// 削除
        NSDictionary *query = @{
                                (__bridge id)kSecClass       : (__bridge id)kSecClassGenericPassword,
                                };
        OSStatus err = SecItemDelete((__bridge CFDictionaryRef)query);
        if (err == noErr) {
            NSLog(@"delete success");
        }
        else{
            NSLog(@"delete fail");
        }
    }
    
    {// 検索
        NSLog(@"identifier:%@",KLMServiceIdentifier);
        NSDictionary *query = @{
                                (__bridge id)kSecClass       : (__bridge id)kSecClassGenericPassword,
                                (__bridge id)kSecAttrGeneric : (id)[KEY_IDENTIFIER dataUsingEncoding:NSUTF8StringEncoding],
                                (__bridge id)kSecAttrService : (id)KLMServiceIdentifier,
                                (__bridge id)kSecReturnData  : (id)kCFBooleanTrue,
                                };
        
        CFDataRef d = nil;
        OSStatus err = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef*)&d);
        NSData *fetchedData = (__bridge NSData*)d;
        if (err == noErr) {
            NSLog(@"fetch success : %@", [fetchedData description]);
        }
        else{
            NSLog(@"fetch fail");    // always fail
        }
    }
}
