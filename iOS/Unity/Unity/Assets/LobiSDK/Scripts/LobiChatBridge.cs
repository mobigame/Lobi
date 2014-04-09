using System;
using System.Collections;
using System.Runtime.InteropServices;

namespace Kayac.Lobi.SDK
{
	public class LobiChatBridge : object {
		public enum GroupListType {
			Public = 0,
			Private,
		}

		public static void PresentGroupList(){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiChat_present_group_list_();
			#endif
		}

		public static void PresentGroupListWithGroupListType(GroupListType groupListType){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiChat_present_group_list_with_group_list_type_((int)groupListType);
			#endif
		}

		public static void CreateGroupWithGroupExId(string gameObjectName,
		                                            string callbackMethodName,
		                                            string groupExId,
		                                            string groupName){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName     = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			byte[] cGroupExId           = System.Text.Encoding.UTF8.GetBytes(groupExId);
			byte[] cGroupName           = System.Text.Encoding.UTF8.GetBytes(groupName);
			LobiChat_create_group_with_group_ex_id_(
				cGameObjectName, cGameObjectName.Length,
				cCallbackMethodName, cCallbackMethodName.Length,
				cGroupExId, cGroupExId.Length,
				cGroupName, cGroupName.Length);
			#endif
		}

		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void LobiChat_present_group_list_();

		[DllImport("__Internal")]
		private static extern void LobiChat_present_group_list_with_group_list_type_(int type);

		[DllImport("__Internal")]
		private static extern void LobiChat_create_group_with_group_ex_id_(byte[] game_object_name, int game_object_name_len,
			                                                               byte[] callback_method_name, int callback_method_name_len,
			                                                               byte[] group_ex_id, int group_ex_id_len,
		                                                                   byte[] group_name, int group_name_len);
		#endif
	}
}
