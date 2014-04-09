using System;
using System.Collections;
using System.Collections.Generic;

using System.Runtime.InteropServices;

namespace Kayac.Lobi.SDK
{
	public class LobiChatAPIBridge : object {
		public enum PermissionType {
			AnyUser = 0,
			Leader,
			SuperUser,
		};

		public static void CreateGroupWithExternalId(string gameObjectName,
		                                             string callbackMethodName,
		                                             string groupExternalId,
		                                             string groupName){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);
			byte[] cGroupName          = System.Text.Encoding.UTF8.GetBytes(groupName);
			LobiChat_create_group_with_external_id_(cGameObjectName, cGameObjectName.Length,
			                                        cCallbackMethodName, cCallbackMethodName.Length,
			                                        cGroupExternalId, cGroupExternalId.Length,
			                                        cGroupName, cGroupName.Length);
			#endif
		}

		public static void CreateGroupWithExternalId(string gameObjectName,
		                                             string callbackMethodName,
		                                             string groupExternalId,
		                                             string groupName,
		                                             PermissionType invitePermission,
		                                             PermissionType addMembersPermission,
		                                             PermissionType joinPermission){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);
			byte[] cGroupName          = System.Text.Encoding.UTF8.GetBytes(groupName);
			LobiChat_create_group_with_external_id_and_permission_(cGameObjectName, cGameObjectName.Length,
			                                                       cCallbackMethodName, cCallbackMethodName.Length,
			                                                       cGroupExternalId, cGroupExternalId.Length,
			                                                       cGroupName, cGroupName.Length,
			                                                       (int) invitePermission,
			                                                       (int) addMembersPermission,
			                                                       (int) joinPermission);
			#endif
		}

		public static void UpdateGroupWithExternalId(string gameObjectName,
		                                             string callbackMethodName,
		                                             string groupExternalId,
		                                             string groupName,
		                                             string description){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);
			byte[] cGroupName          = System.Text.Encoding.UTF8.GetBytes(groupName);
			byte[] cDescription        = System.Text.Encoding.UTF8.GetBytes(description);
			LobiChat_update_group_with_external_id_(cGameObjectName, cGameObjectName.Length,
			                                        cCallbackMethodName, cCallbackMethodName.Length,
			                                        cGroupExternalId, cGroupExternalId.Length,
			                                        cGroupName, cGroupName.Length,
			                                        cDescription, cDescription.Length);
			#endif
		}

		public static void DeleteGroupWithExternalId(string gameObjectName,
		                                             string callbackMethodName,
		                                             string groupExternalId){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);
			LobiChat_delete_group_with_external_id_(cGameObjectName, cGameObjectName.Length,
			                                        cCallbackMethodName, cCallbackMethodName.Length,
			                                        cGroupExternalId, cGroupExternalId.Length);
			#endif
		}

		public static void FetchGroupWithExternalId(string gameObjectName,
		                                             string callbackMethodName,
		                                             string groupExternalId){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);
			LobiChat_fetch_group_with_external_id_(cGameObjectName, cGameObjectName.Length,
			                                       cCallbackMethodName, cCallbackMethodName.Length,
			                                       cGroupExternalId, cGroupExternalId.Length);
			#endif
		}

		public static void JoinGroupWithExternalId(string gameObjectName,
		                                           string callbackMethodName,
		                                           string groupExternalId,
		                                           string groupName){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);
			byte[] cGroupName          = System.Text.Encoding.UTF8.GetBytes(groupName);
			LobiChat_join_group_with_external_id_(cGameObjectName, cGameObjectName.Length,
			                                      cCallbackMethodName, cCallbackMethodName.Length,
			                                      cGroupExternalId, cGroupExternalId.Length,
			                                      cGroupName, cGroupName.Length);
			#endif
		}

		public static void PartGroupWithExternalId(string gameObjectName,
		                                            string callbackMethodName,
		                                            string groupExternalId){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);
			LobiChat_part_group_with_external_id_(cGameObjectName, cGameObjectName.Length,
			                                      cCallbackMethodName, cCallbackMethodName.Length,
			                                      cGroupExternalId, cGroupExternalId.Length);
			#endif
		}

		public static void AddGroupMembersWithExternalIds(string gameObjectName,
		                                                  string callbackMethodName,
		                                                  string groupExternalId,
		                                                  List<string> userExternalIds){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);

			string Ids  = string.Join(",", userExternalIds.ToArray());
			byte[] cIds = System.Text.Encoding.UTF8.GetBytes(Ids);
			LobiChat_add_group_members_with_external_ids_(cGameObjectName, cGameObjectName.Length,
			                                              cCallbackMethodName, cCallbackMethodName.Length,
			                                              cIds, cIds.Length,
			                                              cGroupExternalId, cGroupExternalId.Length);
			#endif
		}

		public static void KickUserWithExternalId(string gameObjectName,
		                                          string callbackMethodName,
		                                          string groupExternalId,
		                                          string userExternalId){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);
			byte[] cUserExternalId     = System.Text.Encoding.UTF8.GetBytes(userExternalId);
			LobiChat_kick_user_with_external_id_(cGameObjectName, cGameObjectName.Length,
			                                     cCallbackMethodName, cCallbackMethodName.Length,
			                                     cUserExternalId, cUserExternalId.Length,
			                                     cGroupExternalId, cGroupExternalId.Length);
			#endif
		}

		public static void ChangeLeaderWithExternalId(string gameObjectName,
		                                              string callbackMethodName,
		                                              string groupExternalId,
		                                              string userExternalId){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);
			byte[] cUserExternalId     = System.Text.Encoding.UTF8.GetBytes(userExternalId);
			LobiChat_change_leader_with_external_id_(cGameObjectName, cGameObjectName.Length,
			                                         cCallbackMethodName, cCallbackMethodName.Length,
			                                         cUserExternalId, cUserExternalId.Length,
			                                         cGroupExternalId, cGroupExternalId.Length);
			#endif
		}

		public static void AddFriendsWithExternalIds(string gameObjectName,
		                                             string callbackMethodName,
		                                             List<string> userExternalIds){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			string Ids  = string.Join(",", userExternalIds.ToArray());
			byte[] cIds = System.Text.Encoding.UTF8.GetBytes(Ids);
			LobiChat_add_friends_with_external_ids_(cGameObjectName, cGameObjectName.Length,
			                                        cCallbackMethodName, cCallbackMethodName.Length,
			                                        cIds, cIds.Length);
			#endif
		}

		public static void RemoveFriendWithExternalId(string gameObjectName,
		                                              string callbackMethodName,
		                                              string userExternalId){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cUserExternalId     = System.Text.Encoding.UTF8.GetBytes(userExternalId);
			LobiChat_remove_friend_with_external_id_(cGameObjectName, cGameObjectName.Length,
			                                         cCallbackMethodName, cCallbackMethodName.Length,
			                                         cUserExternalId, cUserExternalId.Length);
			#endif
		}

		public static void UnlockStamp(string gameObjectName,
		                               string callbackMethodName,
		                               string stampId){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cStampId            = System.Text.Encoding.UTF8.GetBytes(stampId);
			LobiChat_unlock_stamp_(cGameObjectName, cGameObjectName.Length,
			                       cCallbackMethodName, cCallbackMethodName.Length,
			                       cStampId, cStampId.Length);
			#endif
		}

		public static void AskUnlockStamp(string gameObjectName,
		                                  string callbackMethodName,
		                                  string stampId){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cStampId            = System.Text.Encoding.UTF8.GetBytes(stampId);
			LobiChat_ask_stamp_unlocked_(cGameObjectName, cGameObjectName.Length,
			                             cCallbackMethodName, cCallbackMethodName.Length,
			                             cStampId, cStampId.Length);
			#endif
		}

		public static void GetUnreadGroupCount(string gameObjectName,
		                                       string callbackMethodName){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			LobiChat_get_unread_group_count_(cGameObjectName, cGameObjectName.Length,
			                                 cCallbackMethodName, cCallbackMethodName.Length);
			#endif
		}

		public static void GetUnreadGroupCount(string gameObjectName,
		                                       string callbackMethodName,
		                                       string groupExternalId){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);
			LobiChat_get_unread_group_count_with_external_id_(cGameObjectName, cGameObjectName.Length,
			                                                  cCallbackMethodName, cCallbackMethodName.Length,
			                                                  cGroupExternalId, cGroupExternalId.Length);
			#endif
		}

		public static void PostChatWithGroupExternalId(string gameObjectName,
		                                               string callbackMethodName,
		                                               string groupExternalId,
		                                               string message,
		                                               string imageFilePath){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExternalId    = System.Text.Encoding.UTF8.GetBytes(groupExternalId);
			byte[] cMessage            = System.Text.Encoding.UTF8.GetBytes(message);
			byte[] cImageFilePath      = System.Text.Encoding.UTF8.GetBytes(imageFilePath);
			LobiChat_post_chat_with_group_external_id_(cGameObjectName, cGameObjectName.Length,
			                                           cCallbackMethodName, cCallbackMethodName.Length,
			                                           cGroupExternalId, cGroupExternalId.Length,
			                                           cMessage, cMessage.Length,
			                                           cImageFilePath, cImageFilePath.Length);
			#endif
		}

		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void LobiChat_create_group_with_external_id_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] group_external_id, int group_external_id_len,
			byte[] group_name, int group_name_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_create_group_with_external_id_and_permission_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] group_external_id, int group_external_id_len,
			byte[] group_name, int group_name_len,
			int invite_permission,
			int add_members_permission,
			int join_permission);

		[DllImport("__Internal")]
		private static extern void LobiChat_update_group_with_external_id_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] group_external_id, int group_external_id_len,
			byte[] group_name, int group_name_len,
			byte[] description, int description_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_delete_group_with_external_id_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] group_external_id, int group_external_id_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_fetch_group_with_external_id_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] group_external_id, int group_external_id_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_join_group_with_external_id_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] group_external_id, int group_external_id_len,
			byte[] group_name, int group_name_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_part_group_with_external_id_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] group_external_id, int group_external_id_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_add_group_members_with_external_ids_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] user_external_ids, int user_external_ids_len,
			byte[] group_external_id, int group_external_id_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_kick_user_with_external_id_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] user_external_id, int user_external_id_len,
			byte[] group_external_id, int group_external_id_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_change_leader_with_external_id_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] user_external_id, int user_external_id_len,
			byte[] group_external_id, int group_external_id_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_add_friends_with_external_ids_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] user_external_ids, int user_external_ids_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_remove_friend_with_external_id_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] user_external_id, int user_external_id_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_unlock_stamp_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] stamp_id, int stamp_id_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_ask_stamp_unlocked_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] stamp_id, int stamp_id_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_get_unread_group_count_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_get_unread_group_count_with_external_id_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] group_external_id, int group_external_id_len);

		[DllImport("__Internal")]
		private static extern void LobiChat_post_chat_with_group_external_id_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len,
			byte[] group_external_id, int group_external_id_len,
			byte[] message, int message_len,
			byte[] image_file_path, int image_file_path_len);

		#endif
	}
}
