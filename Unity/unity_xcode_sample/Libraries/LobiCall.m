#import <UIKit/UIKit.h>

#import "LobiCall.h"

#import "NakamapRanking.h"
#import "KLRConfiguration.h"
#import "KLRAPI.h"
#import "KLMVideoCapture.h"
#import "KLMPostVideoViewController.h"
#import "KLMPlayWebViewController.h"
#import "KLRRankingViewController.h"

#pragma mark - classes
// 回転対策
@interface KLMUINavigationController : UINavigationController
@end

@implementation KLMUINavigationController
- (NSUInteger)supportedInterfaceOrientations{
    return [self.viewControllers.lastObject supportedInterfaceOrientations];
}
- (BOOL)shouldAutorotate{
    return [self.viewControllers.lastObject shouldAutorotate];
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.viewControllers.lastObject preferredInterfaceOrientationForPresentation];
}
@end

// 残り容量チェック
@interface KLMDryingUpInStorageObserver : NSObject
@property (nonatomic, copy) NSString *gameObjectName;
@property (nonatomic, copy) NSString *callbackMethodName;

+ (instancetype) sharedInstance;
+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName;
+ (void)unregister;
- (void)notify;

@end

@implementation KLMDryingUpInStorageObserver

- (void)dealloc{
    self.gameObjectName = nil;
    self.callbackMethodName = nil;
    [super dealloc];
}

- (void)notify;
{
    NSString *gameObjectName = [[self.gameObjectName copy] autorelease];
    NSString *callbackMethodName = [[self.callbackMethodName copy] autorelease];
    
    if(gameObjectName != nil && [gameObjectName length] != 0 &&
       callbackMethodName != nil && [callbackMethodName length] != 0){
        UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                         [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                         [@"" cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

+ (instancetype) sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self.class alloc] init];
    });
    return sharedInstance;
}

+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName
{
    [KLMDryingUpInStorageObserver unregister];
    [KLMDryingUpInStorageObserver sharedInstance].gameObjectName = gameObjectName;
    [KLMDryingUpInStorageObserver sharedInstance].callbackMethodName = callbackMethodName;
    [[NSNotificationCenter defaultCenter] addObserver:[self.class sharedInstance]
                                             selector:@selector(notify)
                                                 name:KLMDryingUpInStorageNotification
                                               object:nil];
}

+ (void)unregister
{
    [KLMDryingUpInStorageObserver sharedInstance].gameObjectName = nil;
    [KLMDryingUpInStorageObserver sharedInstance].callbackMethodName = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:[self.class sharedInstance]];
}

@end

// 投稿開始
@interface KLMMovieCreatedObserver : NSObject
@property (nonatomic, copy) NSString *gameObjectName;
@property (nonatomic, copy) NSString *callbackMethodName;

+ (instancetype) sharedInstance;
+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName;
+ (void)unregister;
- (void)notify;

@end

@implementation KLMMovieCreatedObserver

- (void)dealloc{
    self.gameObjectName = nil;
    self.callbackMethodName = nil;
    [super dealloc];
}

- (void)notify;
{
    NSString *gameObjectName = [[self.gameObjectName copy] autorelease];
    NSString *callbackMethodName = [[self.callbackMethodName copy] autorelease];
    
    if(gameObjectName != nil && [gameObjectName length] != 0 &&
       callbackMethodName != nil && [callbackMethodName length] != 0){
        UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                         [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                         [@"" cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

+ (instancetype) sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self.class alloc] init];
    });
    return sharedInstance;
}

+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName
{
    [KLMMovieCreatedObserver unregister];
    [KLMMovieCreatedObserver sharedInstance].gameObjectName = gameObjectName;
    [KLMMovieCreatedObserver sharedInstance].callbackMethodName = callbackMethodName;
    [[NSNotificationCenter defaultCenter] addObserver:[self.class sharedInstance]
                                             selector:@selector(notify)
                                                 name:KLMMovieCreatedNotification
                                               object:nil];
}

+ (void)unregister
{
    [KLMMovieCreatedObserver sharedInstance].gameObjectName = nil;
    [KLMMovieCreatedObserver sharedInstance].callbackMethodName = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:[self.class sharedInstance]];
}

@end

// 投稿失敗
@interface KLMMovieCreatedErrorObserver : NSObject
@property (nonatomic, copy) NSString *gameObjectName;
@property (nonatomic, copy) NSString *callbackMethodName;

+ (instancetype) sharedInstance;
+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName;
+ (void)unregister;
- (void)notify;

@end

@implementation KLMMovieCreatedErrorObserver

- (void)dealloc{
    self.gameObjectName = nil;
    self.callbackMethodName = nil;
    [super dealloc];
}

- (void)notify;
{
    NSString *gameObjectName = [[self.gameObjectName copy] autorelease];
    NSString *callbackMethodName = [[self.callbackMethodName copy] autorelease];
    
    if(gameObjectName != nil && [gameObjectName length] != 0 &&
       callbackMethodName != nil && [callbackMethodName length] != 0){
        UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                         [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                         [@"" cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

+ (instancetype) sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self.class alloc] init];
    });
    return sharedInstance;
}

+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName
{
    [KLMMovieCreatedErrorObserver unregister];
    [KLMMovieCreatedErrorObserver sharedInstance].gameObjectName = gameObjectName;
    [KLMMovieCreatedErrorObserver sharedInstance].callbackMethodName = callbackMethodName;
    [[NSNotificationCenter defaultCenter] addObserver:[self.class sharedInstance]
                                             selector:@selector(notify)
                                                 name:KLMMovieCreatedErrorNotification
                                               object:nil];
}

+ (void)unregister
{
    [KLMMovieCreatedErrorObserver sharedInstance].gameObjectName = nil;
    [KLMMovieCreatedErrorObserver sharedInstance].callbackMethodName = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:[self.class sharedInstance]];
}

@end

// 投稿完了
@interface KLMMovieUploadedObserver : NSObject
@property (nonatomic, copy) NSString *gameObjectName;
@property (nonatomic, copy) NSString *callbackMethodName;

+ (instancetype) sharedInstance;
+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName;
+ (void)unregister;
- (void)notify;

@end

@implementation KLMMovieUploadedObserver

- (void)dealloc{
    self.gameObjectName = nil;
    self.callbackMethodName = nil;
    [super dealloc];
}

- (void)notify;
{
    NSString *gameObjectName = [[self.gameObjectName copy] autorelease];
    NSString *callbackMethodName = [[self.callbackMethodName copy] autorelease];
    
    if(gameObjectName != nil && [gameObjectName length] != 0 &&
       callbackMethodName != nil && [callbackMethodName length] != 0){
        UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                         [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                         [@"" cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

+ (instancetype) sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self.class alloc] init];
    });
    return sharedInstance;
}

+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName
{
    [KLMMovieUploadedObserver unregister];
    [KLMMovieUploadedObserver sharedInstance].gameObjectName = gameObjectName;
    [KLMMovieUploadedObserver sharedInstance].callbackMethodName = callbackMethodName;
    [[NSNotificationCenter defaultCenter] addObserver:[self.class sharedInstance]
                                             selector:@selector(notify)
                                                 name:KLMMovieUploadedNotification
                                               object:nil];
}

+ (void)unregister
{
    [KLMMovieUploadedObserver sharedInstance].gameObjectName = nil;
    [KLMMovieUploadedObserver sharedInstance].callbackMethodName = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:[self.class sharedInstance]];
}

@end

// 投稿失敗
@interface KLMMovieUploadedErrorObserver : NSObject
@property (nonatomic, copy) NSString *gameObjectName;
@property (nonatomic, copy) NSString *callbackMethodName;

+ (instancetype) sharedInstance;
+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName;
+ (void)unregister;
- (void)notify;

@end

@implementation KLMMovieUploadedErrorObserver

- (void)dealloc{
    self.gameObjectName = nil;
    self.callbackMethodName = nil;
    [super dealloc];
}

- (void)notify;
{
    NSString *gameObjectName = [[self.gameObjectName copy] autorelease];
    NSString *callbackMethodName = [[self.callbackMethodName copy] autorelease];
    
    if(gameObjectName != nil && [gameObjectName length] != 0 &&
       callbackMethodName != nil && [callbackMethodName length] != 0){
        UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                         [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                         [@"" cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

+ (instancetype) sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self.class alloc] init];
    });
    return sharedInstance;
}

+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName
{
    [KLMMovieUploadedErrorObserver unregister];
    [KLMMovieUploadedErrorObserver sharedInstance].gameObjectName = gameObjectName;
    [KLMMovieUploadedErrorObserver sharedInstance].callbackMethodName = callbackMethodName;
    [[NSNotificationCenter defaultCenter] addObserver:[self.class sharedInstance]
                                             selector:@selector(notify)
                                                 name:KLMMovieUploadedErrorNotification
                                               object:nil];
}

+ (void)unregister
{
    [KLMMovieUploadedErrorObserver sharedInstance].gameObjectName = nil;
    [KLMMovieUploadedErrorObserver sharedInstance].callbackMethodName = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:[self.class sharedInstance]];
}

@end

// 投稿画面を閉じた
@interface KLMDismissingPostVideoViewControllerObserver : NSObject
@property (nonatomic, copy) NSString *gameObjectName;
@property (nonatomic, copy) NSString *callbackMethodName;

+ (instancetype) sharedInstance;
+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName;
+ (void)unregister;
- (void)notify:(NSNotification*)notification;

@end

@implementation KLMDismissingPostVideoViewControllerObserver

- (void)dealloc{
    self.gameObjectName = nil;
    self.callbackMethodName = nil;
    [super dealloc];
}

- (void)notify:(NSNotification*)notification
{
    NSString *gameObjectName = [[self.gameObjectName copy] autorelease];
    NSString *callbackMethodName = [[self.callbackMethodName copy] autorelease];
    
    BOOL isTryed = [notification.userInfo[@"tryPost"] boolValue];
    
    if(gameObjectName != nil && [gameObjectName length] != 0 &&
       callbackMethodName != nil && [callbackMethodName length] != 0){
        UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                         [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                         [(isTryed ? @"1" : @"0") cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

+ (instancetype) sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self.class alloc] init];
    });
    return sharedInstance;
}

+ (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName
{
    [KLMMovieUploadedObserver unregister];
    [KLMMovieUploadedObserver sharedInstance].gameObjectName = gameObjectName;
    [KLMMovieUploadedObserver sharedInstance].callbackMethodName = callbackMethodName;
    [[NSNotificationCenter defaultCenter] addObserver:[self.class sharedInstance]
                                             selector:@selector(notify:)
                                                 name:KLMDismissingPostVideoViewControllerNotification
                                               object:nil];
}

+ (void)unregister
{
    [KLMMovieUploadedObserver sharedInstance].gameObjectName = nil;
    [KLMMovieUploadedObserver sharedInstance].callbackMethodName = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:[self.class sharedInstance]];
}

@end

#pragma mark - static variables
static UIViewController *rootViewController;
static UIViewController*(*getRootViewController)() = NULL;

#pragma mark - private functions
static NSString* error_message(NSString *callbackId)
{
    NSDictionary *params = @{
                             @"error" : @"1",
                             @"id"    : callbackId
                             };
    if([NSJSONSerialization isValidJSONObject:params]){
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:params
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
        if(error == nil){
            return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
        }
    }
    return [NSString stringWithFormat:@"{ \"error\" : \"1\", \"id\" : \"%@\"", callbackId];
}

static NSString* error_message_with_ex(NSString *callbackId, KLRAPIStatusCode status_code, id response)
{
    NSString *errorMessage = @"";
    if(response != nil && [response isKindOfClass:[NSDictionary class]]){
        NSArray* ary = [response objectForKey:@"error"];
        if(ary != nil){
            errorMessage = [ary componentsJoinedByString:@"\n"];
        }
    }
    
    NSDictionary *params = @{
                             @"status_code" : [NSString stringWithFormat:@"%d", status_code],
                             @"error"       : errorMessage,
                             @"id"          : callbackId
                             };
    if([NSJSONSerialization isValidJSONObject:params]){
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:params
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
        if(error == nil){
            return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
        }
    }
    return error_message(callbackId);
}

static NSString* default_success_message(NSString* callbackId, KLRAPIStatusCode status_code)
{
    NSDictionary *params = @{
                             @"status_code" : [NSString stringWithFormat:@"%d", status_code],
                             @"result"      : @{@"success" : @"1"},
                             @"id"          : callbackId
                             };
    if([NSJSONSerialization isValidJSONObject:params]){
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:params
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
        if(error == nil){
            return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
        }
    }
    return error_message(callbackId);
}

static NSString* success_message(NSString* callbackId, KLRAPIStatusCode status_code, NSDictionary *result)
{
    NSDictionary *params = @{
                             @"status_code" : [NSString stringWithFormat:@"%d", status_code],
                             @"result"      : result,
                             @"id"          : callbackId
                             };
    if([NSJSONSerialization isValidJSONObject:params]){
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:params
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
        if(error == nil){
            return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
        }
    }
    return error_message(callbackId);
}

static void show_view_controller(UIViewController *viewController){
    if(getRootViewController != NULL){
        rootViewController = getRootViewController();
    }
    if([[rootViewController class] instancesRespondToSelector:@selector(presentViewController:animated:completion:)]){
        [rootViewController presentViewController:viewController
                                         animated:YES
                                       completion:nil];
    }
    else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [rootViewController presentModalViewController:viewController animated:YES];
#pragma clang diagnostic pop
    }
}

#pragma mark - public functions

int KLR_is_ready_()
{
    return [NakamapRanking isReady] ? 1 : 0;
}

void KLR_set_account_base_name_(const char *user_name, int user_name_len)
{
    NSString *userName = [[[NSString alloc] initWithBytes:user_name
                                                   length:user_name_len
                                                 encoding:NSUTF8StringEncoding] autorelease];
    [KLRConfiguration currentConfiguration].accountBaseName = userName;
}

void KLR_open_ad_()
{
    KLRRankingViewController *next = [[KLRRankingViewController alloc] init];
    next.page  = KLRRankingPageADRecommend;
    next.range = KLRRankingRangeAll;
    show_view_controller(next);
}

void KLR_signup_with_base_name_(
                                const char *game_object_name, int game_object_name_len,
                                const char *callback_method_name, int callback_method_name_len,
                                const char *callback_id, int callback_id_len,
                                const char *user_name, int user_name_len)
{
    NSString *gameObjectName = [[[NSString alloc] initWithBytes:game_object_name
                                                         length:game_object_name_len
                                                       encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackMethodName = [[[NSString alloc] initWithBytes:callback_method_name
                                                             length:callback_method_name_len
                                                           encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackId = [[[NSString alloc] initWithBytes:callback_id
                                                     length:callback_id_len
                                                   encoding:NSUTF8StringEncoding] autorelease];
    NSString *userName = [[[NSString alloc] initWithBytes:user_name
                                                   length:user_name_len
                                                 encoding:NSUTF8StringEncoding] autorelease];
    [KLRAPI signupWithBaseName:userName
                       handler:^(KLRAPIStatusCode code, id response)
     {
         NSString *message;
         if(KLRAPIStatusCodeSuccess != code || response == nil){
             message = error_message_with_ex(callbackId, code, response);
         }
         else{
             message = default_success_message(callbackId, code);
         }
         UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                          [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                          [message cStringUsingEncoding:NSUTF8StringEncoding]);
     }];
}

void KLR_update_user_name_(const char *game_object_name, int game_object_name_len,
                           const char *callback_method_name, int callback_method_name_len,
                           const char *callback_id, int callback_id_len,
                           const char *user_name, int user_name_len){
    NSString *gameObjectName = [[[NSString alloc] initWithBytes:game_object_name
                                                         length:game_object_name_len
                                                       encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackMethodName = [[[NSString alloc] initWithBytes:callback_method_name
                                                             length:callback_method_name_len
                                                           encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackId = [[[NSString alloc] initWithBytes:callback_id
                                                     length:callback_id_len
                                                   encoding:NSUTF8StringEncoding] autorelease];
    NSString *userName = [[[NSString alloc] initWithBytes:user_name
                                                   length:user_name_len
                                                 encoding:NSUTF8StringEncoding] autorelease];
    [KLRAPI updateUserName:userName
                   handler:^(KLRAPIStatusCode code, id response)
     {
         NSString *message;
         if(KLRAPIStatusCodeSuccess != code || response == nil){
             message = error_message_with_ex(callbackId, code, response);
         }
         else{
             message = default_success_message(callbackId, code);
         }
         UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                          [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                          [message cStringUsingEncoding:NSUTF8StringEncoding]);
     }];
}

void KLR_update_user_icon_(const char *game_object_name, int game_object_name_len,
                           const char *callback_method_name, int callback_method_name_len,
                           const char *callback_id, int callback_id_len,
                           const char *file_path, int file_path_len){
    NSString *gameObjectName = [[[NSString alloc] initWithBytes:game_object_name
                                                         length:game_object_name_len
                                                       encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackMethodName = [[[NSString alloc] initWithBytes:callback_method_name
                                                             length:callback_method_name_len
                                                           encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackId = [[[NSString alloc] initWithBytes:callback_id
                                                     length:callback_id_len
                                                   encoding:NSUTF8StringEncoding] autorelease];
    NSString *filePath = [[[NSString alloc] initWithBytes:file_path
                                                   length:file_path_len
                                                 encoding:NSUTF8StringEncoding] autorelease];
    UIImage *iconImage = [UIImage imageWithContentsOfFile:filePath];
    [KLRAPI updateUserIcon:iconImage
                   handler:^(KLRAPIStatusCode code, id response)
     {
         NSString *message;
         if(KLRAPIStatusCodeSuccess != code || response == nil){
             message = error_message_with_ex(callbackId, code, response);
         }
         else{
             message = default_success_message(callbackId, code);
         }
         UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                          [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                          [message cStringUsingEncoding:NSUTF8StringEncoding]);
     }];
}

// capture
// KLMVideoCapture
int KLM_is_capturing_(){
    return [[KLMVideoCapture sharedInstance] isCapturing] ? 1 : 0;
}

void KLM_set_live_wipe_status_(int status){
    [KLMVideoCapture sharedInstance].liveWipeStatus = status;
}

int KLM_get_live_wipe_status_(){
    return [KLMVideoCapture sharedInstance].liveWipeStatus;
}

void KLM_set_wipe_position_x_(float position){
    [KLMVideoCapture sharedInstance].wipePositionX = position;
}

float KLM_get_wipe_position_x_(){
    return [KLMVideoCapture sharedInstance].wipePositionX;
}

void KLM_set_wipe_position_y_(float position){
    [KLMVideoCapture sharedInstance].wipePositionY = position;
}

float KLM_get_wipe_position_y_(){
    return [KLMVideoCapture sharedInstance].wipePositionY;
}

void KLM_set_wipe_square_size_(float size){
    [KLMVideoCapture sharedInstance].wipeSquareSize = size;
}

float KLM_get_wipe_square_size_(){
    return [KLMVideoCapture sharedInstance].wipeSquareSize;
}

void KLM_set_game_sound_volume_(float volume){
    [KLMVideoCapture sharedInstance].gameSoundVolume = volume;
}

float KLM_get_game_sound_volume_(){
    return [KLMVideoCapture sharedInstance].gameSoundVolume;
}

void KLM_set_mic_volume_(float volume){
    [KLMVideoCapture sharedInstance].micVolume = volume;
}

float KLM_get_mic_volume_(){
    return [KLMVideoCapture sharedInstance].micVolume;
}

void KLM_mic_enable_(int enable){
    [KLMVideoCapture sharedInstance].micEnable = (enable != 0);
}

int KLM_is_mic_enable_(){
    return [KLMVideoCapture sharedInstance].micEnable ? 1 : 0;
}

void KLM_prevent_spoiler_(int enable){
    [KLMVideoCapture sharedInstance].preventSpoiler = (enable != 0);
}

int KLM_is_prevent_spoiler_(){
    return [KLMVideoCapture sharedInstance].preventSpoiler ? 1 : 0;
}

void KLM_hide_face_on_preview_(int enable){
    [KLMVideoCapture sharedInstance].hideFaceOnPreview = (enable != 0);
}

int KLM_is_hide_face_on_preview_(){
    return [KLMVideoCapture sharedInstance].hideFaceOnPreview ? 1 : 0;
}

void KLM_set_capture_per_frame_(int frame){
    [KLMVideoCapture sharedInstance].capturePerFrame = frame;
}

int KLM_get_capture_per_frame_(){
    return [KLMVideoCapture sharedInstance].capturePerFrame;
}

void KLM_start_capturing_(){
    [[KLMVideoCapture sharedInstance] startCapturing];
}

void KLM_stop_capturing_(){
    [[KLMVideoCapture sharedInstance] stopCapturing];
}

void KLM_open_post_video_(const char *title, int title_len,
                          const char *description, int description_len,
                          int64_t score,
                          int64_t category)
{
    KLMPostVideoViewController *next = [[KLMPostVideoViewController alloc] init];
    NSString *t = [[[NSString alloc] initWithBytes:title length:title_len encoding:NSUTF8StringEncoding] autorelease];
    NSString *d = [[[NSString alloc] initWithBytes:description length:description_len encoding:NSUTF8StringEncoding] autorelease];
    
    next.postTitle = t;
    next.postDescriotion = d;
    next.postScore = score;
    next.postCategory = category;
    
    KLMUINavigationController *navigationController = [[KLMUINavigationController alloc] initWithRootViewController:next];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    show_view_controller(navigationController);
}

void KLM_open_play_video_()
{
    KLMPlayWebViewController *next = [[KLMPlayWebViewController alloc] init];
    KLMUINavigationController *navigationController = [[KLMUINavigationController alloc] initWithRootViewController:next];
    show_view_controller(navigationController);
}

int KLM_has_movie_()
{
    return [[KLMVideoCapture sharedInstance] hasMovie] ? 1 : 0;
}

#pragma mark - notification

void KLM_register_drying_up_in_storage_observer_(const char *game_object_name, int game_object_name_len,
                                                 const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName = [[[NSString alloc] initWithBytes:game_object_name
                                                         length:game_object_name_len
                                                       encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackMethodName = [[[NSString alloc] initWithBytes:callback_method_name
                                                             length:callback_method_name_len
                                                           encoding:NSUTF8StringEncoding] autorelease];
    [KLMDryingUpInStorageObserver register:gameObjectName callbackMethod:callbackMethodName];
}

void KLM_unregister_drying_up_in_storage_observer_()
{
    [KLMDryingUpInStorageObserver unregister];
}

void KLM_register_movie_created_observer_(const char *game_object_name, int game_object_name_len,
                                          const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName = [[[NSString alloc] initWithBytes:game_object_name
                                                         length:game_object_name_len
                                                       encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackMethodName = [[[NSString alloc] initWithBytes:callback_method_name
                                                             length:callback_method_name_len
                                                           encoding:NSUTF8StringEncoding] autorelease];
    [KLMMovieCreatedObserver register:gameObjectName callbackMethod:callbackMethodName];
}

void KLM_unregister_movie_created_observer_()
{
    [KLMMovieCreatedObserver unregister];
}

void KLM_register_movie_created_error_observer_(const char *game_object_name, int game_object_name_len,
                                                const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName = [[[NSString alloc] initWithBytes:game_object_name
                                                         length:game_object_name_len
                                                       encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackMethodName = [[[NSString alloc] initWithBytes:callback_method_name
                                                             length:callback_method_name_len
                                                           encoding:NSUTF8StringEncoding] autorelease];
    [KLMMovieCreatedErrorObserver register:gameObjectName callbackMethod:callbackMethodName];
}

void KLM_unregister_movie_created_error_observer_()
{
    [KLMMovieCreatedErrorObserver unregister];
}

void KLM_register_movie_uploaded_observer_(const char *game_object_name, int game_object_name_len,
                                           const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName = [[[NSString alloc] initWithBytes:game_object_name
                                                         length:game_object_name_len
                                                       encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackMethodName = [[[NSString alloc] initWithBytes:callback_method_name
                                                             length:callback_method_name_len
                                                           encoding:NSUTF8StringEncoding] autorelease];
    [KLMMovieUploadedObserver register:gameObjectName callbackMethod:callbackMethodName];
}

void KLM_unregister_movie_uploaded_observer_()
{
    [KLMMovieUploadedObserver unregister];
}

void KLM_register_movie_uploaded_error_observer_(const char *game_object_name, int game_object_name_len,
                                                 const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName = [[[NSString alloc] initWithBytes:game_object_name
                                                         length:game_object_name_len
                                                       encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackMethodName = [[[NSString alloc] initWithBytes:callback_method_name
                                                             length:callback_method_name_len
                                                           encoding:NSUTF8StringEncoding] autorelease];
    [KLMMovieUploadedErrorObserver register:gameObjectName callbackMethod:callbackMethodName];
}

void KLM_unregister_movie_uploaded_error_observer_()
{
    [KLMMovieUploadedErrorObserver unregister];
}

void KLM_register_dismissing_post_video_view_controller_observer_(const char *game_object_name, int game_object_name_len,
                                                                  const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName = [[[NSString alloc] initWithBytes:game_object_name
                                                         length:game_object_name_len
                                                       encoding:NSUTF8StringEncoding] autorelease];
    NSString *callbackMethodName = [[[NSString alloc] initWithBytes:callback_method_name
                                                             length:callback_method_name_len
                                                           encoding:NSUTF8StringEncoding] autorelease];
    [KLMDismissingPostVideoViewControllerObserver register:gameObjectName callbackMethod:callbackMethodName];
}

void KLM_unregister_dismissing_post_video_view_controller_observer_()
{
    [KLMDismissingPostVideoViewControllerObserver unregister];
}

// LobiCall.h
void KLR_set_root_view_controller_func(UIViewController*(*getViewController)())
{
    getRootViewController = getViewController;
}
