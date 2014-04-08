using System;
using System.Collections;
using System.Runtime.InteropServices;

namespace Kayac.Lobi.SDK
{
	public class LobiRecBridge : object {
		public enum LiveWipeStatus {
			None = 0,
			InCamera,
			Icon,
		}

		public static bool IsCapturing(){
			bool isCapturing = false;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			isCapturing = LobiRec_is_capturing_() == 1;
			#endif
			return isCapturing;
		}

		public static void SetLiveWipeStatus(LiveWipeStatus status){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_set_live_wipe_status_((int)status);
			#endif
		}

		public static LiveWipeStatus SetLiveWipeStatus(){
			LiveWipeStatus status = LiveWipeStatus.None;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			status = (LiveWipeStatus)LobiRec_get_live_wipe_status_();
			#endif
			return status;
		}

		public static void SetWipePositionX(float x){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_set_wipe_position_x_(x);
			#endif
		}

		public static float GetWipePositionX(){
			float x = 0.0f;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			x = LobiRec_get_wipe_position_x_();
			#endif
			return x;
		}

		public static void SetWipePositionY(float y){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_set_wipe_position_y_(y);
			#endif
		}
		
		public static float GetWipePositionY(){
			float y = 0.0f;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			y = LobiRec_get_wipe_position_y_();
			#endif
			return y;
		}

		public static void SetWipeSquareWize(float size){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_set_wipe_square_size_(size);
			#endif
		}
		
		public static float GetWipeWquareWize(){
			float size = 0.0f;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			size = LobiRec_get_wipe_square_size_();
			#endif
			return size;
		}

		public static void SetGameSoundVolume(float volume){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_set_game_sound_volume_(volume);
			#endif
		}
		
		public static float GetGameSoundVolume(){
			float volume = 0.0f;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			volume = LobiRec_get_game_sound_volume_();
			#endif
			return volume;
		}

		public static void SetAfterRecordingVolume(float volume){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_set_after_recording_volume_(volume);
			#endif
		}

		public static float GetAfterRecordingVolume(){
			float volume = 0.0f;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			volume = LobiRec_get_after_recording_volume_();
			#endif
			return volume;
		}

		public static void SetMicVolume(float volume){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_set_mic_volume_(volume);
			#endif
		}
		
		public static float GetMicVolume(){
			float volume = 0.0f;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			volume = LobiRec_get_mic_volume_();
			#endif
			return volume;
		}

		public static void SetMicEnable(bool enable){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_set_mic_enable_(enable ? 1 : 0);
			#endif
		}
		
		public static bool GetMicEnable(){
			bool enable = false;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			enable = LobiRec_get_mic_enable_() == 1;
			#endif
			return enable;
		}

		public static void SetPreventSpoiler(bool enable){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_set_prevent_spoiler_(enable ? 1 : 0);
			#endif
		}
		
		public static bool GetPreventSpoiler(){
			bool enable = false;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			enable = LobiRec_get_prevent_spoiler_() == 1;
			#endif
			return enable;
		}

		public static void SetHideFaceOnPreview(bool enable){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_set_hide_face_on_preview_(enable ? 1 : 0);
			#endif
		}
		
		public static bool GetHideFaceOnPreview(){
			bool enable = false;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			enable = LobiRec_get_hide_face_on_preview_() == 1;
			#endif
			return enable;
		}

		public static void SetCapturePerFrame(int frame){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_set_capture_per_frame_(frame);
			#endif
		}
		
		public static int GetCapturePerFrame(){
			int frame = 0;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			frame = LobiRec_get_capture_per_frame_();
			#endif
			return frame;
		}

		public static void StartCapturing(){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_start_capturing_();
			#endif
		}

		public static void StopCapturing(){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_stop_capturing_();
			#endif
		}

		public static bool HasMovie(){
			bool hasMovie = false;
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			hasMovie = LobiRec_has_movie_() == 1;
			#endif
			return hasMovie;
		}

		public static void PresentLobiPlay(){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_present_lobi_play_();
			#endif
		}

		public static void PresentLobiPost(string title,
		                                   string postDescription,
		                                   System.Int64 postScore,
		                                   string postCategory){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cTitle           = System.Text.Encoding.UTF8.GetBytes(title);
			byte[] cPostDescription = System.Text.Encoding.UTF8.GetBytes(postDescription);
			byte[] cPostCategory    = System.Text.Encoding.UTF8.GetBytes(postCategory);

			LobiRec_present_lobi_post_(cTitle, cTitle.Length,
			                           cPostDescription, cPostDescription.Length,
			                           postScore,
			                           cPostCategory, cPostCategory.Length);
			#endif
		}

		public static void RegisterDryingUpInStorageObserver(string gameObjectName,
		                                                     string callbackMethodName){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName      = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName  = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			LobiRec_register_drying_up_in_storage_observer_(cGameObjectName, cGameObjectName.Length,
			                                                cCallbackMethodName, cCallbackMethodName.Length);
			#endif
		}

		public static void UnregisterDryingUpInStorageObserver(){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_unregister_drying_up_in_storage_observer_();
			#endif
		}

		public static void RegisterMovieCreatedNotification(string gameObjectName,
		                                                    string callbackMethodName){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName      = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName  = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			LobiRec_register_movie_created_notification_(cGameObjectName, cGameObjectName.Length,
			                                             cCallbackMethodName, cCallbackMethodName.Length);
			#endif
		}
		
		public static void UnregisterMovieCreatedNotification(){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_unregister_movie_created_notification_();
			#endif
		}

		public static void RegisterMovieCreatedErrorNotification(string gameObjectName,
		                                                         string callbackMethodName){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName      = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName  = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			LobiRec_register_movie_created_error_notification_(cGameObjectName, cGameObjectName.Length,
			                                                   cCallbackMethodName, cCallbackMethodName.Length);
			#endif
		}
		
		public static void UnregisterMovieCreatedErrorNotification(){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_unregister_movie_created_error_notification_();
			#endif
		}

		public static void RegisterMovieUploadedNotification(string gameObjectName,
		                                                     string callbackMethodName){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName      = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName  = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			LobiRec_register_movie_uploaded_notification_(cGameObjectName, cGameObjectName.Length,
			                                              cCallbackMethodName, cCallbackMethodName.Length);
			#endif
		}
		
		public static void UnregisterMovieUploadedNotification(){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_unregister_movie_uploaded_notification_();
			#endif
		}

		public static void RegisterMovieUploadedErrorNotification(string gameObjectName,
		                                                          string callbackMethodName){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName      = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName  = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			LobiRec_register_movie_uploaded_error_notification_(cGameObjectName, cGameObjectName.Length,
			                                                    cCallbackMethodName, cCallbackMethodName.Length);
			#endif
		}
		
		public static void UnregisterMovieUploadedErrorNotification(){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_unregister_movie_uploaded_error_notification_();
			#endif
		}

		public static void RegisterDismissingPostVideoViewNotification(string gameObjectName,
		                                                               string callbackMethodName){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			byte[] cGameObjectName      = System.Text.Encoding.UTF8.GetBytes(gameObjectName);
			byte[] cCallbackMethodName  = System.Text.Encoding.UTF8.GetBytes(callbackMethodName);
			LobiRec_register_dismissing_post_video_view_controller_notification_(cGameObjectName, cGameObjectName.Length,
			                                                                     cCallbackMethodName, cCallbackMethodName.Length);
			#endif
		}
		
		public static void UnregisterDismissingPostVideoViewNotification(){
			#if UNITY_ANDROID
			#endif
			#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
			LobiRec_unregister_dismissing_post_video_view_controller_notification_();
			#endif
		}

		#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
		[DllImport("__Internal")]
		private static extern int LobiRec_is_capturing_();

		[DllImport("__Internal")]
		private static extern void LobiRec_set_live_wipe_status_(int status);

		[DllImport("__Internal")]
		private static extern int LobiRec_get_live_wipe_status_();

		[DllImport("__Internal")]
		private static extern void LobiRec_set_wipe_position_x_(float x);

		[DllImport("__Internal")]
		private static extern float LobiRec_get_wipe_position_x_();

		[DllImport("__Internal")]
		private static extern void LobiRec_set_wipe_position_y_(float y);
		
		[DllImport("__Internal")]
		private static extern float LobiRec_get_wipe_position_y_();

		[DllImport("__Internal")]
		private static extern void LobiRec_set_wipe_square_size_(float size);

		[DllImport("__Internal")]
		private static extern float LobiRec_get_wipe_square_size_();

		[DllImport("__Internal")]
		private static extern void LobiRec_set_game_sound_volume_(float volume);

		[DllImport("__Internal")]
		private static extern float LobiRec_get_game_sound_volume_();

		[DllImport("__Internal")]
		private static extern void LobiRec_set_after_recording_volume_(float volume);

		[DllImport("__Internal")]
		private static extern float LobiRec_get_after_recording_volume_();

		[DllImport("__Internal")]
		private static extern void LobiRec_set_mic_volume_(float volume);
		
		[DllImport("__Internal")]
		private static extern float LobiRec_get_mic_volume_();

		[DllImport("__Internal")]
		private static extern void LobiRec_set_mic_enable_(int enable);
		
		[DllImport("__Internal")]
		private static extern int LobiRec_get_mic_enable_();

		[DllImport("__Internal")]
		private static extern void LobiRec_set_prevent_spoiler_(int enable);
		
		[DllImport("__Internal")]
		private static extern int LobiRec_get_prevent_spoiler_();

		[DllImport("__Internal")]
		private static extern void LobiRec_set_hide_face_on_preview_(int enable);
		
		[DllImport("__Internal")]
		private static extern int LobiRec_get_hide_face_on_preview_();

		[DllImport("__Internal")]
		private static extern void LobiRec_set_capture_per_frame_(int frame);
		
		[DllImport("__Internal")]
		private static extern int LobiRec_get_capture_per_frame_();

		[DllImport("__Internal")]
		private static extern void LobiRec_start_capturing_();

		[DllImport("__Internal")]
		private static extern void LobiRec_stop_capturing_();

		[DllImport("__Internal")]
		private static extern int LobiRec_has_movie_();

		[DllImport("__Internal")]
		private static extern void LobiRec_present_lobi_play_();

		[DllImport("__Internal")]
		private static extern void LobiRec_present_lobi_post_(
			byte[] title, int title_len,
			byte[] post_description, int post_description_len,
			System.Int64 post_score,
			byte[] post_category, int post_category_len);

		[DllImport("__Internal")]
		private static extern void LobiRec_register_drying_up_in_storage_observer_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len);

		[DllImport("__Internal")]
		private static extern void LobiRec_unregister_drying_up_in_storage_observer_();

		[DllImport("__Internal")]
		private static extern void LobiRec_register_movie_created_notification_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len);
		
		[DllImport("__Internal")]
		private static extern void LobiRec_unregister_movie_created_notification_();

		[DllImport("__Internal")]
		private static extern void LobiRec_register_movie_created_error_notification_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len);
		
		[DllImport("__Internal")]
		private static extern void LobiRec_unregister_movie_created_error_notification_();

		[DllImport("__Internal")]
		private static extern void LobiRec_register_movie_uploaded_notification_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len);
		
		[DllImport("__Internal")]
		private static extern void LobiRec_unregister_movie_uploaded_notification_();

		[DllImport("__Internal")]
		private static extern void LobiRec_register_movie_uploaded_error_notification_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len);
		
		[DllImport("__Internal")]
		private static extern void LobiRec_unregister_movie_uploaded_error_notification_();

		[DllImport("__Internal")]
		private static extern void LobiRec_register_dismissing_post_video_view_controller_notification_(
			byte[] game_object_name, int game_object_name_len,
			byte[] callback_method_name, int callback_method_name_len);
		
		[DllImport("__Internal")]
		private static extern void LobiRec_unregister_dismissing_post_video_view_controller_notification_();
		#endif
	}
}
