#import <UIKit/UIKit.h>

#import <LobiCore/LobiCore.h>
#import <LobiChat/LobiAPI+Chat.h>
#import <LobiCore/LobiNetworkResponse.h>

#import "LobiCoreCommon.h"
#import "LobiCoreAPICommon.h"


#import <LobiCore/LobiCore.h>
#import <LobiCore/LobiAPI.h>
#import <LobiCore/LobiNetworkResponse.h>
#import <LobiCore/LobiConst.h>

#pragma mark - create/delete group
/*
+ (void)createGroupWithExternalID:(NSString *)groupExternalID
                        groupName:(NSString *)groupName
                       completion:(LobiNetworkHandler)handler;
 */
void LobiChat_create_group_with_external_id_(const char *game_object_name, int game_object_name_len,
                                             const char *callback_method_name, int callback_method_name_len,
                                             const char *group_external_id, int group_external_id_len,
                                             const char *group_name, int group_name_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    NSString *groupName          = make_autorelease_string(group_name);
    [LobiAPI createGroupWithExternalID:groupExternalId
                             groupName:groupName
                            completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}

/*
+ (void)createGroupWithExternalID:(NSString *)groupExternalID
                        groupName:(NSString *)groupName
                 invitePermission:(LobiPermissionType)invitePermission
             addMembersPermission:(LobiPermissionType)addMembersPermission
                   joinPermission:(LobiPermissionType)joinPermission
                       completion:(LobiNetworkHandler)handler;
 */

void LobiChat_create_group_with_external_id_and_permission_(const char *game_object_name, int game_object_name_len,
                                                            const char *callback_method_name, int callback_method_name_len,
                                                            const char *group_external_id, int group_external_id_len,
                                                            const char *group_name, int group_name_len,
                                                            int invite_permission,
                                                            int add_members_permission,
                                                            int join_permission)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    NSString *groupName          = make_autorelease_string(group_name);
    [LobiAPI createGroupWithExternalID:groupExternalId
                             groupName:groupName
                      invitePermission:invite_permission
                  addMembersPermission:add_members_permission
                        joinPermission:join_permission
                            completion:^(LobiNetworkResponse *res)
     {
         LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
     }];
}

/*
+ (void)updateGroupWithExternalID:(NSString *)groupExternalID
                        groupName:(NSString *)groupName
                      description:(NSString *)description
                       completion:(LobiNetworkHandler)handler;
 */
void LobiChat_update_group_with_external_id_(const char *game_object_name, int game_object_name_len,
                                             const char *callback_method_name, int callback_method_name_len,
                                             const char *group_external_id, int group_external_id_len,
                                             const char *group_name, int group_name_len,
                                             const char *description, int description_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    NSString *groupName          = make_autorelease_string(group_name);
    NSString *d                  = make_autorelease_string(description);
    [LobiAPI updateGroupWithExternalID:groupExternalId
                             groupName:groupName
                           description:d
                            completion:^(LobiNetworkResponse *res)
     {
         LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
     }];
}

/*
+ (void)deleteGroupWithExternalID:(NSString *)groupExternalID
                       completion:(LobiNetworkHandler)handler;
 */
void LobiChat_delete_group_with_external_id_(const char *game_object_name, int game_object_name_len,
                                             const char *callback_method_name, int callback_method_name_len,
                                             const char *group_external_id, int group_external_id_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    [LobiAPI deleteGroupWithExternalID:groupExternalId
                            completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}

/*
+ (void)fetchGroupWithExternalID:(NSString *)externalID
                      completion:(LobiNetworkHandler)handler;
 */
void LobiChat_fetch_group_with_external_id_(const char *game_object_name, int game_object_name_len,
                                            const char *callback_method_name, int callback_method_name_len,
                                            const char *group_external_id, int group_external_id_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    [LobiAPI fetchGroupWithExternalID:groupExternalId
                           completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}

#pragma mark - join/part group
/*
+ (void)joinGroupWithExternalID:(NSString *)groupExternalID
                      groupName:(NSString *)groupName
                     completion:(LobiNetworkHandler)handler;
 */
void LobiChat_join_group_with_external_id_(const char *game_object_name, int game_object_name_len,
                                           const char *callback_method_name, int callback_method_name_len,
                                           const char *group_external_id, int group_external_id_len,
                                           const char *group_name, int group_name_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    NSString *groupName          = make_autorelease_string(group_name);
    [LobiAPI joinGroupWithExternalID:groupExternalId
                           groupName:groupName
                          completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}

/*
+ (void)partGroupWithExternalID:(NSString *)groupExternalID
                     completion:(LobiNetworkHandler)handler;
 */
void LobiChat_part_group_with_external_id_(const char *game_object_name, int game_object_name_len,
                                           const char *callback_method_name, int callback_method_name_len,
                                           const char *group_external_id, int group_external_id_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    [LobiAPI partGroupWithExternalID:groupExternalId
                          completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}

#pragma mark - manage members of the group
/*
+ (void)addGroupMembersWithExternalIDs:(NSArray *)userExternalIDs
                       groupExternalID:(NSString *)groupExternalID
                            completion:(LobiNetworkHandler)handler;
 */
void LobiChat_add_group_members_with_external_ids_(const char *game_object_name, int game_object_name_len,
                                                   const char *callback_method_name, int callback_method_name_len,
                                                   const char *user_external_ids, int user_external_ids_len,
                                                   const char *group_external_id, int group_external_id_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *userExternalIds    = make_autorelease_string(user_external_ids);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    [LobiAPI addGroupMembersWithExternalIDs:[userExternalIds componentsSeparatedByString:@","]
                            groupExternalID:groupExternalId
                                 completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}

/*
+ (void)kickUserWithExternalID:(NSString *)userExternalID
               groupExternalID:(NSString *)groupExternalID
                    completion:(LobiNetworkHandler)handler;
 */
void LobiChat_kick_user_with_external_id_(const char *game_object_name, int game_object_name_len,
                                          const char *callback_method_name, int callback_method_name_len,
                                          const char *user_external_id, int user_external_id_len,
                                          const char *group_external_id, int group_external_id_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *userExternalId     = make_autorelease_string(user_external_id);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    [LobiAPI kickUserWithExternalID:userExternalId
                    groupExternalID:groupExternalId
                         completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}

/*
+ (void)changeLeaderWithExternalID:(NSString *)leaderExternalID
                   groupExternalID:(NSString *)groupExternalID
                        completion:(LobiNetworkHandler)handler;
 */
void LobiChat_change_leader_with_external_id_(const char *game_object_name, int game_object_name_len,
                                              const char *callback_method_name, int callback_method_name_len,
                                              const char *user_external_id, int user_external_id_len,
                                              const char *group_external_id, int group_external_id_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *userExternalId     = make_autorelease_string(user_external_id);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    [LobiAPI changeLeaderWithExternalID:userExternalId
                        groupExternalID:groupExternalId
                             completion:^(LobiNetworkResponse *res)
     {
         LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
     }];
}

#pragma mark - manage friends
/*
+ (void)addFriendsWithExternalIDs:(NSArray *)externalIDs
                       completion:(LobiNetworkHandler)handler;
 */
void LobiChat_add_friends_with_external_ids_(const char *game_object_name, int game_object_name_len,
                                             const char *callback_method_name, int callback_method_name_len,
                                             const char *user_external_ids, int user_external_ids_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *userExternalIds     = make_autorelease_string(user_external_ids);
    [LobiAPI addFriendsWithExternalIDs:[userExternalIds componentsSeparatedByString:@","]
                            completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}

/*
+ (void)removeFriendsWithExternalID:(NSString *)externalID
                         completion:(LobiNetworkHandler)handler;
 */
void LobiChat_remove_friend_with_external_id_(const char *game_object_name, int game_object_name_len,
                                              const char *callback_method_name, int callback_method_name_len,
                                              const char *user_external_id, int user_external_id_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *userExternalId     = make_autorelease_string(user_external_id);
    [LobiAPI removeFriendsWithExternalID:userExternalId
                              completion:^(LobiNetworkResponse *res)
     {
         LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
     }];
}

#pragma mark - stamp achievement
/*
+ (void)unlockStamp:(NSString *)stampID
         completion:(LobiNetworkHandler)handler;
 */
void LobiChat_unlock_stamp_(const char *game_object_name, int game_object_name_len,
                            const char *callback_method_name, int callback_method_name_len,
                            const char *stamp_id, int stamp_id_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *stampId            = make_autorelease_string(stamp_id);
    [LobiAPI unlockStamp:stampId
              completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}

/*
+ (void)askStampUnlocked:(NSString *)stampID
              completion:(LobiNetworkHandler)handler;
 */
void LobiChat_ask_stamp_unlocked_(const char *game_object_name, int game_object_name_len,
                                  const char *callback_method_name, int callback_method_name_len,
                                  const char *stamp_id, int stamp_id_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *stampId            = make_autorelease_string(stamp_id);
    [LobiAPI askStampUnlocked:stampId
              completion:^(LobiNetworkResponse *res)
     {
         LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
     }];
}

#pragma mark - unread count
/*
+ (void)getUnreadGroupCountWithHandler:(LobiNetworkHandler)handler;
 */
void LobiChat_get_unread_group_count_(const char *game_object_name, int game_object_name_len,
                                      const char *callback_method_name, int callback_method_name_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    [LobiAPI getUnreadGroupCountWithHandler:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}

/*
+ (void)getUnreadCountGroupWithExternalID:(NSString *)externalID
                               completion:(LobiNetworkHandler)handler;
 */
void LobiChat_get_unread_group_count_with_external_id_(const char *game_object_name, int game_object_name_len,
                                                       const char *callback_method_name, int callback_method_name_len,
                                                       const char *group_external_id, int group_external_id_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    [LobiAPI getUnreadCountGroupWithExternalID:groupExternalId
                                    completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}


#pragma mark - post image & text
/*
+ (void)postChatWithGroupExternalID:(NSString *)groupExternalID
                            message:(NSString *)message
                              image:(UIImage *)image
                         completion:(LobiNetworkHandler)handler;
 */
void LobiChat_post_chat_with_group_external_id_(const char *game_object_name, int game_object_name_len,
                                                const char *callback_method_name, int callback_method_name_len,
                                                const char *group_external_id, int group_external_id_len,
                                                const char *message, int message_len,
                                                const char *image_file_path, int image_file_path_len)
{
    if(message == NULL && image_file_path == NULL){
        LobiAPICommon_error_message_with_ex(LobiAPIStatusCodeFatalError, @{@"error" : @[@"message and image_file_path not set"]});
        return;
    }
    
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *groupExternalId    = make_autorelease_string(group_external_id);
    NSString *m                  = (message == NULL ? nil : make_autorelease_string(message));
    NSString *imageFilePath      = (image_file_path == NULL ? nil : make_autorelease_string(image_file_path));
    UIImage *image               = nil;
    
    if(imageFilePath != nil){
        if(![[NSFileManager defaultManager] fileExistsAtPath:imageFilePath]){
            LobiAPICommon_error_message_with_ex(LobiAPIStatusCodeFatalError, @{@"error" : @[@"image_file not found"]});
            return;
        }
        image = [UIImage imageWithContentsOfFile:imageFilePath];
        if(image == nil){
            LobiAPICommon_error_message_with_ex(LobiAPIStatusCodeFatalError, @{@"error" : @[@"[UIImage imageWithContentsOfFile:filePath] fail"]});
            return;
        }
    }
    
    [LobiAPI postChatWithGroupExternalID:groupExternalId
                                 message:m
                                   image:image
                              completion:^(LobiNetworkResponse *res)
    {
        LobiAPICommon_callback_to_unity(gameObjectName, callbackMethodName, res);
    }];
}
