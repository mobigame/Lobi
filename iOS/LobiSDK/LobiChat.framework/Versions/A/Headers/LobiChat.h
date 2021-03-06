
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LobiChatConst.h"

/**
 LobiSDKのチャット機能を制御するクラスです。
 */
@interface LobiChat : NSObject

/**
 *  LobiChatSDKのバージョンを返します。
 *
 *  @return バージョン番号
 */
+ (NSString*)SDKVersion;

/**
 *  LobiCoreのサインアップで受け取った情報をLobiChat側に引き継ぎます。
 *
 *  @param dictionary LobiCoreのサインアップ情報
 */
+ (void)inflateFromSignupInformation:(NSDictionary *)dictionary;

/**
 *  LobiChatのビューを初期化してBlocksで返します。
 *
 *  @param handler 初期化したLobiChatのViewController
 */
+ (void)createGroupListViewController:(void(^)(UIViewController *viewController))handler;

/**
 *  チャットグループの一覧を表示します。デフォルトでは公開グループの一覧を表示します。
 */
+ (void)presentGroupList;

/**
 *  公開グループ、またはプライベートグループを指定してチャットグループの一覧を表示します。
 *
 *  @param groupListType 表示するチャットグループ一覧のタイプを指定します。（公開グループ、またはプライベートグループ）
 */
+ (void)presentGroupListWithGroupListType:(LobiChatGroupListType)groupListType;

/**
 *  GroupExIDとグループ名を指定してプライベートグループを作成し、Blocksで返します。
 *  ※指定されたGroupExIDが存在しなければ、指定されているグループ名を元にチャットグループを作成します。
 *  ※指定されたGroupExIDが既に存在している場合、グループIDで指定されたチャットグループを返します。
 *
 *  @param groupExId グループID
 *  @param baseName グループ名
 *  @param handler   作成したプライベートのチャットグループ
 */
+ (void)createGroupWithGroupExid:(NSString *)groupExId
                       groupName:(NSString *)groupName
                         handler:(void(^)(UIViewController *viewController))handler;

/**
 *  ViewControllerを指定してチャットグループを表示します。
 *
 *  @param viewController 表示するチャットグループのViewController
 */
+ (void)presentChatViewController:(UIViewController *)viewController;


/**
 *  リンク機能（ハッシュタグ）が有効になっているアプリでにて
 *  ハッシュタグ(#)以降に表示されるメッセージをゲーム側に渡します。
 *
 *  @param URL application:openURL:sourceApplication:annotation:から渡されるURL
 *
 *  @return ハッシュタグ以降のメッセージ
 */
+ (NSString *)appFromURL:(NSURL *)URL;

/**
 *  LobiChat画面の背景色を変更します。
 *
 *  @param color 指定する背景色
 */
+ (void)setBackGroundCustomColor:(UIColor *)color;

@end
