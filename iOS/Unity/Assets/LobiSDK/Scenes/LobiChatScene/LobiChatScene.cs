using UnityEngine;
using System.Collections;

using Kayac.Lobi.SDK;

public class LobiChatScene : MonoBehaviour {
	
	// Use this for initialization
	void Start () {
		Debug.Log("IsReady() = " + (LobiCoreBridge.IsReady() ? "true" : "false"));
	}
	
	void OnGUI()
	{
		if (GUI.Button(new Rect(50, 50, 200, 50), "<-")){
			Application.LoadLevel("MainScene");
		}
		if (GUI.Button(new Rect(50, 150, 200, 50), "PresentGroupList")){
			LobiChatBridge.PresentGroupList();
		}
		if (GUI.Button(new Rect(50, 250, 200, 50), "PresentGroupListWithGroupListType-Private")){
			LobiChatBridge.PresentGroupListWithGroupListType(LobiChatBridge.GroupListType.Private);
		}
		if (GUI.Button(new Rect(50, 350, 200, 50), "PresentGroupListWithGroupListType-Public")){
			LobiChatBridge.PresentGroupListWithGroupListType(LobiChatBridge.GroupListType.Public);
		}
		if (GUI.Button(new Rect(50, 450, 200, 50), "CreateGroupWithGroupExId")){
			LobiChatBridge.CreateGroupWithGroupExId(name, "CreateGroupWithGroupExIdCallback", "sample_group_ex_id", "sample_group_name");
		}
	}

	void CreateGroupWithGroupExIdCallback(string message){
		Debug.Log("called CreateGroupWithGroupExIdCallback");
		Debug.Log(message);
	}
}
