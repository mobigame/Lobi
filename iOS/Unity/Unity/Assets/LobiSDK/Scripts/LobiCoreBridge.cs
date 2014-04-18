using System;
using System.Collections;
using System.Runtime.InteropServices;

namespace Kayac.Lobi.SDK
{
	public class LobiCoreBridge : object {
		public enum PopOverArrowDirection {
			Up = 0,
			Left,
			Right,
		};

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

		public static void SetupPopOverController(int x, int y, LobiCoreBridge.PopOverArrowDirection direction){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiCore_setup_pop_over_controller_(x, y, (int)direction);
			#endif
		}

		public static void SetNavigationBarCustomColor(float r, float g, float b){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiCore_set_navigation_bar_custom_color_(r, g, b);
			#endif
		}		
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern int LobiCore_is_ready_();

		[DllImport("__Internal")]
		private static extern void LobiCore_set_account_base_name_(byte[] base_name, int base_name_len);

		[DllImport("__Internal")]
		private static extern void LobiCore_present_profile_();

		[DllImport("__Internal")]
		private static extern void LobiCore_setup_pop_over_controller_(int x, int y, int direction);
		
		[DllImport("__Internal")]
		private static extern void LobiCore_set_navigation_bar_custom_color_(float r, float g, float b);
		#endif
	}
}
