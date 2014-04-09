using System;
using System.Collections;
using System.Runtime.InteropServices;

namespace Kayac.Lobi.SDK
{
	public class LobiCoreBridge : object {
		public static bool IsReady(){
			bool isReady = false;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			isReady = LobiCore_is_ready_() == 1;
			#endif
			return isReady;
		}

		public static void SetAccountBaseName(string baseName){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cBaseName = System.Text.Encoding.UTF8.GetBytes(baseName);		
			LobiCore_set_account_base_name_(cBaseName, cBaseName.Length);
			#endif
		}

		public static void PresentProfile(){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiCore_present_profile_();
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern int LobiCore_is_ready_();

		[DllImport("__Internal")]
		private static extern void LobiCore_set_account_base_name_(byte[] base_name, int base_name_len);

		[DllImport("__Internal")]
		private static extern void LobiCore_present_profile_();
		#endif
	}
}
