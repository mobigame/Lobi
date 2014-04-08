using UnityEngine;
using System.Collections;

using Kayac.Lobi.SDK;

public class LobiRecScene : MonoBehaviour {
	
	// Use this for initialization
	void Start () {
		Debug.Log("IsReady() = " + (LobiCoreBridge.IsReady() ? "true" : "false"));
	}
	
	void OnGUI()
	{
		if (GUI.Button(new Rect(50, 50, 200, 50), "<-")){
			Application.LoadLevel("MainScene");
		}
		if (GUI.Button(new Rect(50, 150, 200, 50), "StartCapturing")){
			LobiRecBridge.SetMicEnable(true);
			LobiRecBridge.SetMicVolume(1.0f);
			LobiRecBridge.SetGameSoundVolume(0.2f);
			
			LobiRecBridge.SetLiveWipeStatus(LobiRecBridge.LiveWipeStatus.InCamera);
			LobiRecBridge.SetWipePositionX(100.0f);
			LobiRecBridge.SetWipePositionY(100.0f);
			LobiRecBridge.SetWipeSquareWize(100.0f);
			
			LobiRecBridge.SetPreventSpoiler(false);
			LobiRecBridge.SetCapturePerFrame(2);
			LobiRecBridge.StartCapturing();
		}
		if (GUI.Button(new Rect(50, 250, 200, 50), "StopCapturing")){
			LobiRecBridge.StopCapturing();
		}
		if (GUI.Button(new Rect(50, 350, 200, 50), "PresentLobiPost")){
			LobiRecBridge.PresentLobiPost("sample title", "sample description", 0, "");
		}
		if (GUI.Button(new Rect(50, 450, 200, 50), "PresentLobiPlay")){
			LobiRecBridge.PresentLobiPlay();
		}
	}
}
