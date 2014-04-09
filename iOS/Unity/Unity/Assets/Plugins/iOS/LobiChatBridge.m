#import <UIKit/UIKit.h>

#import <LobiChat/LobiChat.h>
#import <LobiCore/LobiCore.h>
#import "LobiCoreBridge.h"

#import "LobiCoreCommon.h"
#import "LobiCoreAPICommon.h"

void LobiChat_present_group_list_()
{
    [LobiCore setRootViewController:LobiCore_get_root_view_controller()];
    [LobiChat presentGroupList];
}

void LobiChat_present_group_list_with_group_list_type_(int type)
{
    LobiChatGroupListType chatGroupListType = type;
    [LobiCore setRootViewController:LobiCore_get_root_view_controller()];
    [LobiChat presentGroupListWithGroupListType:chatGroupListType];
}

void LobiChat_create_group_with_group_ex_id_(const char *game_object_name, int game_object_name_len,
                                             const char *callback_method_name, int callback_method_name_len,
                                             const char* group_ex_id, int group_ex_id_len,
                                             const char* group_name, int group_name_len)
{
    NSString *gameObjectName     = make_autorelease_string(game_object_name);
    NSString *callbackMethodName = make_autorelease_string(callback_method_name);
    NSString *groupExId = make_autorelease_string(group_ex_id);
    NSString *groupName = make_autorelease_string(group_name);
    [LobiChat createGroupWithGroupExid:groupExId
                             groupName:groupName
                               handler:^(UIViewController *viewController)
    {
        if(viewController != nil){
            LobiAPICommon_success_callback_to_unity(gameObjectName, callbackMethodName);
            [LobiCore setRootViewController:LobiCore_get_root_view_controller()];
            [LobiChat presentChatViewController:viewController];
        }
        else{
            LobiAPICommon_error_callback_to_unity(gameObjectName, callbackMethodName);
        }
    }];
}
