using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace Kayac.Lobi
{
	public class LobiRec : object {
		public enum LiveWipeStatus {
			None = 0,
			InCamera,
			Icon,
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern int KLR_is_ready_ ();
		#endif
		
		public static bool IsReady(){
			bool IsReady = false;
			#if UNITY_ANDROID
			AndroidJavaClass lobiClass = new AndroidJavaClass("com.kayac.lobi.ranking.sdk.unity.LobiBridge");
			IsReady = (lobiClass.CallStatic<int>("isReady") == 1);
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			IsReady = KLR_is_ready_() == 1;
			#endif
			return IsReady;
		}
		
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLR_set_account_base_name_ (byte[] user_name, int user_name_len);
		#endif
		
		public static void SetAccountBaseName(string user_name){
			#if UNITY_ANDROID
			AndroidJavaClass lobiClass = new AndroidJavaClass("com.kayac.lobi.ranking.sdk.unity.LobiBridge");
			lobiClass.CallStatic("setAccountBaseName", user_name);
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] UserName = System.Text.Encoding.UTF8.GetBytes(user_name);		
			KLR_set_account_base_name_(UserName, UserName.Length);
			#endif
		}

		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLR_open_ad_ ();
		#endif

		public static void OpenAd(){
			#if UNITY_ANDROID
			AndroidJavaClass lobiClass = new AndroidJavaClass("com.kayac.lobi.ranking.sdk.unity.LobiBridge");
			lobiClass.CallStatic("openAd");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLR_open_ad_();
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLR_signup_with_base_name_ (byte[] game_object_name, int game_object_name_len,
		                                                       byte[] callback_method_name, int callback_method_name_len,
		                                                       byte[] callback_id, int callback_id_len,
		                                                       byte[] user_name, int user_name_len);
		#endif
		
		public static void SignupWithBaseName(string game_object_name, string callback_method_name, string id, string user_name){
			#if UNITY_ANDROID
			AndroidJavaClass lobiClass = new AndroidJavaClass("com.kayac.lobi.ranking.sdk.unity.LobiBridge");
			lobiClass.CallStatic("signupWithBaseName", game_object_name, callback_method_name, id, user_name);
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] GameObjectName = System.Text.Encoding.UTF8.GetBytes(game_object_name);
			byte[] CallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callback_method_name);
			byte[] Id = System.Text.Encoding.UTF8.GetBytes(id);
			byte[] UserName = System.Text.Encoding.UTF8.GetBytes(user_name);
			KLR_signup_with_base_name_(GameObjectName, GameObjectName.Length,
			                           CallbackMethodName, CallbackMethodName.Length,
			                           Id, Id.Length,
			                           UserName, UserName.Length);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLR_update_user_name_ (byte[] game_object_name, int game_object_name_len,
		                                                  byte[] callback_method_name, int callback_method_name_len,
		                                                  byte[] callback_id, int callback_id_len,
		                                                  byte[] user_name, int user_name_len);
		#endif
		
		public static void UpdateUserName(string game_object_name, string callback_method_name, string id, string user_name){
			#if UNITY_ANDROID
			AndroidJavaClass lobiClass = new AndroidJavaClass("com.kayac.lobi.ranking.sdk.unity.LobiBridge");
			lobiClass.CallStatic("updateUserName", game_object_name, callback_method_name, id, user_name);
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] GameObjectName = System.Text.Encoding.UTF8.GetBytes(game_object_name);
			byte[] CallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callback_method_name);
			byte[] Id = System.Text.Encoding.UTF8.GetBytes(id);
			byte[] UserName = System.Text.Encoding.UTF8.GetBytes(user_name);
			KLR_update_user_name_(GameObjectName, GameObjectName.Length,
			                      CallbackMethodName, CallbackMethodName.Length,
			                      Id, Id.Length,
			                      UserName, UserName.Length);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLR_update_user_icon_ (byte[] game_object_name, int game_object_name_len,
		                                                  byte[] callback_method_name, int callback_method_name_len,
		                                                  byte[] callback_id, int callback_id_len,
		                                                  byte[] file_path, int file_path_len);
		#endif
		
		public static void UpdateUserIcon(string game_object_name, string callback_method_name, string id, string file_path){
			#if UNITY_ANDROID
			AndroidJavaClass lobiClass = new AndroidJavaClass("com.kayac.lobi.ranking.sdk.unity.LobiBridge");
			lobiClass.CallStatic("updateUserIcon", game_object_name, callback_method_name, id, file_path);
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] GameObjectName = System.Text.Encoding.UTF8.GetBytes(game_object_name);
			byte[] CallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callback_method_name);
			byte[] Id = System.Text.Encoding.UTF8.GetBytes(id);
			byte[] FilePath = System.Text.Encoding.UTF8.GetBytes(file_path);
			KLR_update_user_icon_(GameObjectName, GameObjectName.Length,
			                      CallbackMethodName, CallbackMethodName.Length,
			                      Id, Id.Length,
			                      FilePath, FilePath.Length);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern int KLM_is_capturing_();
		#endif
		
		public static bool IsCapturing (){
			bool IsCapturing = false;
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			IsCapturing = KLM_is_capturing_() == 1;
			#endif
			return IsCapturing;
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_set_live_wipe_status_(int status);
		#endif
		
		public static void SetLiveWipeStatus(LiveWipeStatus status){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_set_live_wipe_status_((int) status);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern int KLM_get_live_wipe_status_();
		#endif
		
		public static LiveWipeStatus GetLiveWipeStatus(){
			LiveWipeStatus status = LiveWipeStatus.None;
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			status = (LiveWipeStatus)KLM_get_live_wipe_status_();
			#endif
			return status;
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_set_wipe_position_x_(float position);
		#endif
		
		public static void SetWipePositionX(float position){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_set_wipe_position_x_(position);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern float KLM_get_wipe_position_x_();
		#endif
		
		public static float GetWipePositionX(){
			float position = 0.0f;
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			position = KLM_get_wipe_position_x_();
			#endif
			return position;
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_set_wipe_position_y_(float position);
		#endif
		
		public static void SetWipePositionY(float position){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_set_wipe_position_y_(position);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern float KLM_get_wipe_position_y_();
		#endif
		
		public static float GetWipePositionY(){
			float position = 0.0f;
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			position = KLM_get_wipe_position_y_();
			#endif
			return position;
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_set_wipe_square_size_(float size);
		#endif
		
		public static void SetWipeSquareSize(float size){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_set_wipe_square_size_(size);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern float KLM_get_wipe_square_size_();
		#endif
		
		public static float GetWipeSquareSize(){
			float size = 0.0f;
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			size = KLM_get_wipe_square_size_();
			#endif
			return size;
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_set_game_sound_volume_(float volume);
		#endif
		
		public static void SetGameSoundVolume(float volume){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_set_game_sound_volume_(volume);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern float KLM_get_game_sound_volume_();
		#endif
		
		public static float GetGameSoundVolume(){
			float volume = 0.0f;
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			volume = KLM_get_game_sound_volume_();
			#endif
			return volume;
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_set_mic_volume_(float volume);
		#endif
		
		public static void SetMicVolume(float volume){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_set_mic_volume_(volume);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern float KLM_get_mic_volume_();
		#endif
		
		public static float GetMicVolume(){
			float volume = 0.0f;
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			volume = KLM_get_mic_volume_();
			#endif
			return volume;
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_mic_enable_(int enable);
		#endif
		
		public static void MicEnable(bool enable){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_mic_enable_(enable ? 1 : 0);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern int KLM_is_mic_enable_();
		#endif
		
		public static bool IsMicEnable(){
			bool enable = false;
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			enable = KLM_is_mic_enable_() != 0;
			#endif
			return enable;
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_prevent_spoiler_(int enable);
		#endif
		
		public static void PreventSpoiler(bool enable){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_prevent_spoiler_(enable ? 1 : 0);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern int KLM_is_prevent_spoiler_();
		#endif
		
		public static bool IsPreventSpoiler(){
			bool enable = false;
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			enable = KLM_is_prevent_spoiler_() != 0;
			#endif
			return enable;
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_set_capture_per_frame_(int frame);
		#endif
		
		public static void SetCapturePerFrame(int frame){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_set_capture_per_frame_(frame);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern int KLM_get_capture_per_frame_();
		#endif
		
		public static int GetCapturePerFrame(){
			int frame = 0;
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			frame = KLM_get_capture_per_frame_();
			#endif
			return frame;
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_start_capturing_();
		#endif
		
		public static void StartCapturing (){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_start_capturing_();
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_stop_capturing_();
		#endif
		
		public static void StopCapturing (){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_stop_capturing_();
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_open_post_video_(byte[] title, int title_len,
		                                                byte[] description, int description_len,
		                                                System.Int64 score,
		                                                System.Int64 rankingId);
		#endif
		
		public static void OpenPostVideo(string title, string description, System.Int64 score, System.Int64 rankingId){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] Title = System.Text.Encoding.UTF8.GetBytes(title);
			byte[] Description = System.Text.Encoding.UTF8.GetBytes(description);
			KLM_open_post_video_(Title, Title.Length,
			                     Description, Description.Length,
			                     score,
			                     rankingId);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_open_play_video_();
		#endif
		
		public static void OpenPlayVideo(){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_open_play_video_();
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern int KLM_has_movie_();
		#endif
		
		public static bool HasMovie(){
			bool result = false;
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			result = KLM_has_movie_() != 0;
			#endif
			return result;
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_register_drying_up_in_storage_observer_(byte[] game_object_name, int game_object_name_len,
		                                                                       byte[] callback_method_name, int callback_method_name_len);
		#endif
		
		public static void RegisterDryingUpInStorageObserver(string game_object_name, string callback_method_name){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] GameObjectName = System.Text.Encoding.UTF8.GetBytes(game_object_name);
			byte[] CallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callback_method_name);
			KLM_register_drying_up_in_storage_observer_(GameObjectName, GameObjectName.Length,
			                                            CallbackMethodName, CallbackMethodName.Length);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_unregister_drying_up_in_storage_observer_();
		#endif
		
		public static void UnregisterDryingUpInStorageObserver(){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_unregister_drying_up_in_storage_observer_();
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_register_movie_created_observer_(byte[] game_object_name, int game_object_name_len,
		                                                                byte[] callback_method_name, int callback_method_name_len);
		#endif
		
		public static void RegisterMovieCreatedObserver(string game_object_name, string callback_method_name){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] GameObjectName = System.Text.Encoding.UTF8.GetBytes(game_object_name);
			byte[] CallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callback_method_name);
			KLM_register_movie_created_observer_(GameObjectName, GameObjectName.Length,
			                                     CallbackMethodName, CallbackMethodName.Length);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_unregister_movie_created_observer_();
		#endif
		
		public static void UnregisterMovieCreatedObserver(){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_unregister_movie_created_observer_();
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_register_movie_uploaded_observer_(byte[] game_object_name, int game_object_name_len,
		                                                                 byte[] callback_method_name, int callback_method_name_len);
		#endif
		
		public static void RegisterMovieUploadedObserver(string game_object_name, string callback_method_name){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] GameObjectName = System.Text.Encoding.UTF8.GetBytes(game_object_name);
			byte[] CallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callback_method_name);
			KLM_register_movie_uploaded_observer_(GameObjectName, GameObjectName.Length,
			                                      CallbackMethodName, CallbackMethodName.Length);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_unregister_movie_uploaded_observer_();
		#endif
		
		public static void UnregisterMovieUploadedObserver(){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_unregister_movie_uploaded_observer_();
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_register_dismissing_post_video_view_controller_observer_(byte[] game_object_name, int game_object_name_len,
		                                                                                        byte[] callback_method_name, int callback_method_name_len);
		#endif
		
		public static void RegisterDismissingPostVideoViewControllerObserver(string game_object_name, string callback_method_name){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] GameObjectName = System.Text.Encoding.UTF8.GetBytes(game_object_name);
			byte[] CallbackMethodName = System.Text.Encoding.UTF8.GetBytes(callback_method_name);
			KLM_register_dismissing_post_video_view_controller_observer_(GameObjectName, GameObjectName.Length,
			                                                             CallbackMethodName, CallbackMethodName.Length);
			#endif
		}
		
		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern void KLM_unregister_dismissing_post_video_view_controller_observer_();
		#endif
		
		public static void UnregisterDismissingPostVideoViewControllerObserver(){
			#if UNITY_ANDROID
			Debug.Log("not supported yet");
			#endif
			
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			KLM_unregister_dismissing_post_video_view_controller_observer_();
			#endif
		}
		
	}
}