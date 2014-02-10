using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;
using Kayac.Lobi;

public class Sample : MonoBehaviour {
	private bool isRecoding = false;
	private float restTime  = 0.0f;

	// Use this for initialization
	void Start () {
	}

	// Update is called once per frame
	void Update () {
		if(restTime <= 0.0f){
			if(isRecoding){
				LobiRec.StopCapturing();
			}
			isRecoding = false;
		}
		else{
			restTime -= Time.deltaTime;
			isRecoding = true;
		}
	}

	#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
	[DllImport("__Internal")]
	private static extern void KLM_util_clear_user_();
	#endif

	void OnGUI () {
		if(!isRecoding){
			if (GUI.Button(new Rect(0, 50, 200, 50), "Capture")){
				isRecoding = true;
				restTime   = 10.0f;

				LobiRec.MicEnable(true);
				LobiRec.SetMicVolume(1.0f);
				LobiRec.SetGameSoundVolume(0.2f);

				LobiRec.SetLiveWipeStatus(LobiRec.LiveWipeStatus.InCamera);
				LobiRec.SetWipePositionX(100.0f);
				LobiRec.SetWipePositionY(100.0f);
				LobiRec.SetWipeSquareSize(100.0f);

				LobiRec.PreventSpoiler(false);
				LobiRec.SetCapturePerFrame(2);
				LobiRec.StartCapturing();
			}
			if (GUI.Button(new Rect(0, 150, 200, 50), "Share")){
				LobiRec.OpenPostVideo("sample title", "sample description", 123, 0);
			}
			if (GUI.Button(new Rect(0, 250, 200, 50), "Web")){
				LobiRec.OpenPlayVideo();
			}
			if (GUI.Button(new Rect(0, 350, 200, 50), "Clear User")){
				#if ((UNITY_IOS || UNITY_IPHONE) && ! UNITY_EDITOR)
				KLM_util_clear_user_();
				#endif
			}
		}
	}
}
