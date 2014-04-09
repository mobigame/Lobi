#import <UIKit/UIKit.h>

#import <LobiCore/LobiCore.h>
#import <LobiRec/LobiRec.h>

#import "LobiCoreBridge.h"
#import "LobiCoreCommon.h"

#import "LobiRecBridge.h"

@interface LobiRecUnityObserver : NSObject
@property (nonatomic, copy) NSString *gameObjectName;
@property (nonatomic, copy) NSString *callbackMethodName;
@property (nonatomic, copy) NSString *name;
- (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName;
- (void)unregister;
- (void)notify:(NSNotification*)notification;
@end

@implementation LobiRecUnityObserver

- (void)dealloc{
    self.gameObjectName = nil;
    self.callbackMethodName = nil;
    self.name = nil;
    [super dealloc];
}

- (void)register:(NSString*)gameObjectName callbackMethod:(NSString*)callbackMethodName
{
    [self unregister];
    self.gameObjectName = gameObjectName;
    self.callbackMethodName = callbackMethodName;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notify:)
                                                 name:self.name
                                               object:nil];
}

- (void)unregister
{
    self.gameObjectName = nil;
    self.callbackMethodName = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)notify:(NSNotification*)notification
{
    NSString *gameObjectName = [[self.gameObjectName copy] autorelease];
    NSString *callbackMethodName = [[self.callbackMethodName copy] autorelease];
    
    if(gameObjectName != nil && [gameObjectName length] != 0 && callbackMethodName != nil && [callbackMethodName length] != 0){
        UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                         [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                         [@"" cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

@end

#pragma mark -
// 残り容量チェック
@interface LobiRecDryingUpInStorageObserver : LobiRecUnityObserver
+ (instancetype) sharedInstance;
@end

@implementation LobiRecDryingUpInStorageObserver
- (instancetype)init
{
    self = [super init];
    if(self != nil){
        self.name = KLVDryingUpInStorageNotification;
    }
    return self;
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

@end

void LobiRec_register_drying_up_in_storage_observer_(const char *game_object_name, int game_object_name_len,
                                                     const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    [[LobiRecDryingUpInStorageObserver sharedInstance] register:gameObjectName callbackMethod:callbackMethodName];
}

void LobiRec_unregister_drying_up_in_storage_observer_()
{
    [[LobiRecDryingUpInStorageObserver sharedInstance] unregister];
}

#pragma mark -
// 投稿開始
@interface LobiRecMovieCreatedNotification : LobiRecUnityObserver
+ (instancetype) sharedInstance;
@end

@implementation LobiRecMovieCreatedNotification

- (instancetype)init
{
    self = [super init];
    if(self != nil){
        self.name = KLVMovieCreatedNotification;
    }
    return self;
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

- (void)notify:(NSNotification*)notification
{
    NSString *gameObjectName = [[self.gameObjectName copy] autorelease];
    NSString *callbackMethodName = [[self.callbackMethodName copy] autorelease];
    
    if(gameObjectName != nil && [gameObjectName length] != 0 && callbackMethodName != nil && [callbackMethodName length] != 0){
        NSString *url = notification.userInfo[@"url"];
        url = (url == nil ? @"" : url);
        UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                         [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                         [url cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

@end

void LobiRec_register_movie_created_notification_(const char *game_object_name, int game_object_name_len,
                                                  const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    [[LobiRecMovieCreatedNotification sharedInstance] register:gameObjectName callbackMethod:callbackMethodName];
}

void LobiRec_unregister_movie_created_notification_()
{
    [[LobiRecMovieCreatedNotification sharedInstance] unregister];
}

#pragma mark -
// 投稿開始失敗
@interface LobiRecMovieCreatedErrorNotification : LobiRecUnityObserver
+ (instancetype) sharedInstance;
@end

@implementation LobiRecMovieCreatedErrorNotification

- (instancetype)init
{
    self = [super init];
    if(self != nil){
        self.name = KLVMovieCreatedErrorNotification;
    }
    return self;
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

@end

void LobiRec_register_movie_created_error_notification_(const char *game_object_name, int game_object_name_len,
                                                        const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    [[LobiRecMovieCreatedErrorNotification sharedInstance] register:gameObjectName callbackMethod:callbackMethodName];
}

void LobiRec_unregister_movie_created_error_notification_()
{
    [[LobiRecMovieCreatedErrorNotification sharedInstance] unregister];
}

#pragma mark -
// 投稿完了
@interface LobiRecMovieUploadedNotification : LobiRecUnityObserver
+ (instancetype) sharedInstance;
@end

@implementation LobiRecMovieUploadedNotification

- (instancetype)init
{
    self = [super init];
    if(self != nil){
        self.name = KLVMovieUploadedNotification;
    }
    return self;
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

@end

void LobiRec_register_movie_uploaded_notification_(const char *game_object_name, int game_object_name_len,
                                                   const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    [[LobiRecMovieUploadedNotification sharedInstance] register:gameObjectName callbackMethod:callbackMethodName];
}

void LobiRec_unregister_movie_uploaded_notification_()
{
    [[LobiRecMovieUploadedNotification sharedInstance] unregister];
}

#pragma mark -
// 投稿中失敗
@interface LobiRecMovieUploadedErrorNotification : LobiRecUnityObserver
+ (instancetype) sharedInstance;
@end

@implementation LobiRecMovieUploadedErrorNotification

- (instancetype)init
{
    self = [super init];
    if(self != nil){
        self.name = KLVMovieUploadedErrorNotification;
    }
    return self;
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

@end

void LobiRec_register_movie_uploaded_error_notification_(const char *game_object_name, int game_object_name_len,
                                                         const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    [[LobiRecMovieUploadedErrorNotification sharedInstance] register:gameObjectName callbackMethod:callbackMethodName];
}

void LobiRec_unregister_movie_uploaded_error_notification_()
{
    [[LobiRecMovieUploadedErrorNotification sharedInstance] unregister];
}

// 投稿画面を閉じた
@interface LobiRecDismissingPostVideoViewControllerNotification : LobiRecUnityObserver
+ (instancetype) sharedInstance;
@end

@implementation LobiRecDismissingPostVideoViewControllerNotification

- (instancetype)init
{
    self = [super init];
    if(self != nil){
        self.name = KLVDismissingPostVideoViewControllerNotification;
    }
    return self;
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

- (void)notify:(NSNotification*)notification
{
    NSString *gameObjectName = [[self.gameObjectName copy] autorelease];
    NSString *callbackMethodName = [[self.callbackMethodName copy] autorelease];
    
    if(gameObjectName != nil && [gameObjectName length] != 0 && callbackMethodName != nil && [callbackMethodName length] != 0){
        BOOL isTryed = [notification.userInfo[@"tryPost"] boolValue];
        UnitySendMessage([gameObjectName cStringUsingEncoding:NSUTF8StringEncoding],
                         [callbackMethodName cStringUsingEncoding:NSUTF8StringEncoding],
                         [(isTryed ? @"1" : @"0") cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

@end

void LobiRec_register_dismissing_post_video_view_controller_notification_(const char *game_object_name, int game_object_name_len,
                                                                          const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    [[LobiRecDismissingPostVideoViewControllerNotification sharedInstance] register:gameObjectName callbackMethod:callbackMethodName];
}

void LobiRec_unregister_dismissing_post_video_view_controller_notification_()
{
    [[LobiRecDismissingPostVideoViewControllerNotification sharedInstance] unregister];
}

# pragma mark -
static void(*sUnityPause)(bool pause);

void LobiRec_set_unity_pause_func(void(*unityPause)(bool))
{
    sUnityPause = unityPause;
}

int LobiRec_is_capturing_()
{
    return [LobiRec sharedInstance].isCapturing ? 1 : 0;
}

void LobiRec_set_live_wipe_status_(int status)
{
    [LobiRec sharedInstance].liveWipeStatus = status;
}

int LobiRec_get_live_wipe_status_()
{
    return [LobiRec sharedInstance].liveWipeStatus;
}

void LobiRec_set_wipe_position_x_(float x)
{
    [LobiRec sharedInstance].wipePositionX = x;
}

float LobiRec_get_wipe_position_x_()
{
    return [LobiRec sharedInstance].wipePositionX;
}

void LobiRec_set_wipe_position_y_(float y)
{
    [LobiRec sharedInstance].wipePositionY = y;
}

float LobiRec_get_wipe_position_y_()
{
    return [LobiRec sharedInstance].wipePositionY;
}

void LobiRec_set_wipe_square_size_(float size)
{
    [LobiRec sharedInstance].wipeSquareSize = size;
}

float LobiRec_get_wipe_square_size_()
{
    return [LobiRec sharedInstance].wipeSquareSize;
}

void LobiRec_set_game_sound_volume_(float volume)
{
    [LobiRec sharedInstance].gameSoundVolume = volume;
}

float LobiRec_get_game_sound_volume_()
{
    return [LobiRec sharedInstance].gameSoundVolume;
}

void LobiRec_set_after_recording_volume_(float volume)
{
    [LobiRec sharedInstance].afterRecordingVolume = volume;
}

float LobiRec_get_after_recording_volume_()
{
    return [LobiRec sharedInstance].afterRecordingVolume;
}

void LobiRec_set_mic_volume_(float volume)
{
    [LobiRec sharedInstance].micVolume = volume;
}

float LobiRec_get_mic_volume_()
{
    return [LobiRec sharedInstance].micVolume;
}

void LobiRec_set_mic_enable_(int enable)
{
    [LobiRec sharedInstance].micEnable = (enable == 1);
}

int LobiRec_get_mic_enable_()
{
    return [LobiRec sharedInstance].micEnable ? 1 : 0;
}

void LobiRec_set_prevent_spoiler_(int enable)
{
    [LobiRec sharedInstance].preventSpoiler = (enable == 1);
}

int LobiRec_get_prevent_spoiler_()
{
    return [LobiRec sharedInstance].preventSpoiler ? 1 : 0;
}

void LobiRec_set_hide_face_on_preview_(int enable)
{
    [LobiRec sharedInstance].hideFaceOnPreview = (enable == 1);
}

int LobiRec_get_hide_face_on_preview_()
{
    return [LobiRec sharedInstance].hideFaceOnPreview ? 1 : 0;
}

void LobiRec_set_capture_per_frame_(int frame)
{
    [LobiRec sharedInstance].capturePerFrame = frame;
}

int LobiRec_get_capture_per_frame_()
{
    return [LobiRec sharedInstance].capturePerFrame;
}

void LobiRec_start_capturing_()
{
    [LobiRec startCapturing];
}

void LobiRec_stop_capturing_()
{
    [LobiRec stopCapturing];
}

int LobiRec_has_movie_()
{
    return [LobiRec hasMovie] ? 1 : 0;
}

void LobiRec_present_lobi_play_()
{
    [LobiCore setRootViewController:LobiCore_get_root_view_controller()];
    [LobiRec presentLobiPlay];
}

void LobiRec_present_lobi_post_(const char* title, int title_len,
                                const char* post_description, int post_description_len,
                                int64_t post_score,
                                const char* post_category, int post_category_len)
{
    NSString *t               = make_autorelease_string(title);
    NSString *postDescription = make_autorelease_string(post_description);
    NSString *postCategory    = make_autorelease_string(post_category);
    [LobiCore setRootViewController:LobiCore_get_root_view_controller()];
    [LobiRec presentLobiPostWithTitle:t
                       postDescrition:postDescription
                            postScore:post_score
                         postCategory:postCategory
                       prepareHandler:^
    {
        if(sUnityPause != NULL){
            sUnityPause(true);
        }
    }
                         afterHandler:^
    {
        if(sUnityPause != NULL){
            sUnityPause(false);
        }
    }];
}
