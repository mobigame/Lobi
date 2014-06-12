
#import <LobiCore/LobiAPI.h>
#import <LobiCore/LobiNetworkResponse.h>
#import <LobiCore/LobiConst.h>

@interface LobiAPI (Chat)

#pragma mark - call any API
/// ---------------------------------
/// @name Call Any API
/// ---------------------------------

/**
 * REST APIのパスを指定してAPIを実行します。
 *
 * @param path REST APIのパスを指定します。
 * @param method LobiHTTPMethodGETまたは、LobiHTTPMethodPOSTを指定します。
 * @param params パラメータを指定します。
 */
+ (void)callAPI:(NSString *)path
         method:(LobiHTTPMethod)method
         params:(NSDictionary *)params
     completion:(LobiNetworkHandler)handler;

#pragma mark - create/delete group
/// ---------------------------------
/// @name Create/Delete Group
/// ---------------------------------

/**
 * 指定したGroupExternalIDに対応したグループを作成します。
 * 既にグループが存在する場合にはエラーとなります。
 *
 * @param groupExternalID グループのIDを指定します。
 * @param groupName グループの名前を指定します。
 */
+ (void)createGroupWithExternalID:(NSString *)groupExternalID
                        groupName:(NSString *)groupName
                       completion:(LobiNetworkHandler)handler;

/**
 * 指定したGroupExternalIDに対応したグループを作成します。
 * 既にグループが存在する場合にはエラーとなります。
 *
 * @param groupExternalID グループのIDを指定します。
 * @param groupName グループの名前を指定します。
 * @param invitePermission グループに招待する権限をもつユーザーを指定します。
 * @param addMembersPermission グループに追加する権限をもつユーザーを指定します。
 * @param joinPermission グループに参加する権限をもつユーザーを指定します。
 */
+ (void)createGroupWithExternalID:(NSString *)groupExternalID
                        groupName:(NSString *)groupName
                 invitePermission:(LobiPermissionType)invitePermission
             addMembersPermission:(LobiPermissionType)addMembersPermission
                   joinPermission:(LobiPermissionType)joinPermission
                       completion:(LobiNetworkHandler)handler;

/**
 *  ユーザーのExternalIDを指定して1on1チャットグループを作成します。
 *
 *  @param userExternalID 1on1チャットグループを作成するユーザーのExternalID
 */

+ (void)create1on1GroupWithUserExternalID:(NSString *)userExternalID
                               completion:(LobiNetworkHandler)handler;

/**
 * 指定したGroupExternalIDに対応したグループの名前とメモを変更します。
 * このAPIはリーダーのみが実行することができ、リーダー以外のメンバーが実行した場合にはエラーとなります。
 *
 * @param groupExternalID グループのIDを指定します。
 * @param groupName グループの名前を指定します。
 * @param description グループのメモに記述する内容を指定します。
 */
+ (void)updateGroupWithExternalID:(NSString *)groupExternalID
                        groupName:(NSString *)groupName
                      description:(NSString *)description
                       completion:(LobiNetworkHandler)handler;

/**
 * 指定したGroupExternalIDに対応したグループを削除します。
 * このAPIはリーダーのみが実行することができ、
 * リーダー以外のメンバーが実行した場合にはエラーとなります。
 *
 * @param groupExternalID 削除するグループのIDを指定します。
 */
+ (void)deleteGroupWithExternalID:(NSString *)groupExternalID
                       completion:(LobiNetworkHandler)handler;

/**
 * 指定したGroupExternalIDに対応したグループの情報を取得します。
 *
 * @param groupExternalID 取得するグループのIDを指定します。
 */
+ (void)fetchGroupWithExternalID:(NSString *)externalID
                      completion:(LobiNetworkHandler)handler;

#pragma mark - join/part group
/// ---------------------------------
/// @name Join/Part Group
/// ---------------------------------

/**
 * 指定したGroupExternalIDに対応したグループに参加します。
 * GroupExternalIDに対応するグループが存在しない場合、
 * groupNameで指定した名前のグループが作成されます。
 *
 * @param groupExternalID 参加するグループのIDを指定します。
 * @param groupName グループの名前を指定します。
 */
+ (void)joinGroupWithExternalID:(NSString *)groupExternalID
                      groupName:(NSString *)groupName
                     completion:(LobiNetworkHandler)handler;

/**
 * 指定したGroupExternalIDに対応したグループから脱退します。
 * なお、リーダーはこのAPIによってグループから抜けることはできません。
 * リーダーがグループから脱退する場合には次いずれかの方法を選択してください。
 *
 *  - 先にリーダーの変更を行なってから、このAPIをコールしてください。
 *
 *  - グループを削除してください。
 *
 * @param groupExternalID 脱退するグループのIDを指定します。
 */
+ (void)partGroupWithExternalID:(NSString *)groupExternalID
                     completion:(LobiNetworkHandler)handler;

#pragma mark - manage members of the group
/// ---------------------------------
/// @name Manage Members of Group
/// ---------------------------------

/**
 * ユーザーをグループのメンバーに追加します。
 *
 * @param userExternalIDs 追加するユーザーのUserExternalIDの配列を指定します。
 * @param groupExternalID 追加先のグループのGroupExternalIDを指定します。
 */
+ (void)addGroupMembersWithExternalIDs:(NSArray *)userExternalIDs
                       groupExternalID:(NSString *)groupExternalID
                            completion:(LobiNetworkHandler)handler;

/**
 * ユーザーをグループのメンバーから追放します。
 * このAPIはリーダーのみが実行することができます。
 *
 * @param userExternalIDs 追放するユーザーのUserExternalIDの配列を指定します。
 * @param groupExternalID 追放するグループのGroupExternalIDを指定します。
 */
+ (void)kickUserWithExternalID:(NSString *)userExternalID
               groupExternalID:(NSString *)groupExternalID
                    completion:(LobiNetworkHandler)handler;

/**
 * グループのリーダーを変更します。
 * このAPIはリーダーのみが実行することができます。
 *
 * @param leaderExternalID 新しいリーダーのUserExternalIDを指定します。
 * @param groupExternalID リーダー変更するグループのGroupExternalIDを指定します。
 */
+ (void)changeLeaderWithExternalID:(NSString *)leaderExternalID
                   groupExternalID:(NSString *)groupExternalID
                        completion:(LobiNetworkHandler)handler;

#pragma mark - manage friends
/// ---------------------------------
/// @name Manage Friends
/// ---------------------------------

/**
 * 指定したユーザーとLobiSDK上で友だちになります。
 *
 * @param externalIDs 友達に追加するユーザーのUserExternalIDの配列を指定します。
 */
+ (void)addFriendsWithExternalIDs:(NSArray *)externalIDs
                       completion:(LobiNetworkHandler)handler;

/**
 * 指定したユーザーをLobiSDK上の友だちから外します。
 *
 * @param externalID 友達を解除するユーザーのUserExternalID。
 */
+ (void)removeFriendsWithExternalID:(NSString *)externalID
                         completion:(LobiNetworkHandler)handler;

#pragma mark - stamp achievement
/// ---------------------------------
/// @name Stamp Achievement
/// ---------------------------------

/**
 * IDが<STAMP_UID>のスタンプグループの利用制限を解除します。
 * <STAMP_UID>には開発チームからあらかじめ通知されたものを利用してください。
 * 成功時のresponseは@{@"success": @1}のNSDictionaryとなります。
 *
 * @param stampID 開発チームからあらかじめ通知されたスタンプ用のIDを指定します。
 */
+ (void)unlockStamp:(NSString *)stampID
         completion:(LobiNetworkHandler)handler;

/**
 * IDが<STAMP_UID>のスタンプグループの利用制限が解除されているか確認します。
 * <STAMP_UID>には開発チームからあらかじめ通知されたものを利用してください。
 * 成功時のresponseは@{@"unlocked": (NSNumber *)value}のNSDictionaryとなります。
 *
 * @param stampID 解除されたかどうかを確認するスタンプ用のIDを指定します。
 */
+ (void)askStampUnlocked:(NSString *)stampID
              completion:(LobiNetworkHandler)handler;


#pragma mark - unread count
/// ---------------------------------
/// @name Unread Count
/// ---------------------------------

//チャットの未読があるグループの数を取得する
/**
 * チャットの未読があるグループの数を取得します。
 * 成功時のresponseは@{@"count":(NSString *)value}のNSDictionaryとなります。
 * 10件以上の未読グループが存在する場合のレスポンスは@{@"count":@"9+"}となります。
 */
+ (void)getUnreadGroupCountWithHandler:(LobiNetworkHandler)handler;

/**
 * グループを指定して未読のチャット数を取得します。
 * 成功時のresponseは@{@"count": (NSNumber *)value}のNSDictionaryとなります。
 *
 * @param groupExternalID 未読チャット数を取得するグループのIDを指定します。
 */
+ (void)getUnreadCountGroupWithExternalID:(NSString *)externalID
                               completion:(LobiNetworkHandler)handler;

#pragma mark - post image & text
/// ---------------------------------
/// @name Post Image and Text
/// ---------------------------------

/**
 * テキストと画像を指定してチャットを投稿します。
 *
 * @param groupExternalID 暗号化されたUserExternalIDを指定してください。
 * @param message UserExternalIDの暗号化に使用したIVを指定してください。
 * @param image UserExternalIDの暗号化に使用したIVを指定してください。
 */
+ (void)postChatWithGroupExternalID:(NSString *)groupExternalID
                            message:(NSString *)message
                              image:(UIImage *)image
                         completion:(LobiNetworkHandler)handler;

@end
