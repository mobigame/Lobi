using UnityEngine;
using System.Collections;

using Kayac.Lobi.SDK;

public class LobiCoreScene : MonoBehaviour {
	// Use this for initialization
	void Start () {
		Debug.Log("IsReady() = " + (LobiCoreBridge.IsReady() ? "true" : "false"));
	}
	
	void OnGUI()
	{
		if (GUI.Button(new Rect(50, 50, 200, 50), "<-")){
			Application.LoadLevel("MainScene");
		}
		if (GUI.Button(new Rect(50, 150, 200, 50), "SignupWithBaseName")){
			LobiCoreAPIBridge.SignupWithBaseName(name, "SignupWithBaseNameCallback", "LobiUnity");
		}
		if (GUI.Button(new Rect(50, 250, 200, 50), "SetAccountBaseName")){
			LobiCoreBridge.SetAccountBaseName("LobiUnity");
		}
		if (GUI.Button(new Rect(50, 350, 200, 50), "PresentProfile")){
			LobiCoreBridge.PresentProfile();
		}
	}

	void SignupWithBaseNameCallback(string message){
		Debug.Log("called SignupWithBaseNameCallback");
		Debug.Log(message);
	}
}
