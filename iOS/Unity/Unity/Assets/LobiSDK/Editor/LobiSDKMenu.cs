using UnityEngine;
using UnityEditor;
using System.Collections;
using System.IO;

using Kayac.Lobi.SDK;

public class LobiSDKMenu : ScriptableWizard {
	private static readonly string ASSETS_PARRENT = "Assets/LobiSDK/Editor";
	private static readonly string ASSETS_DIR     = "Resources";
	private static readonly string ASSETS_PATH    = ASSETS_PARRENT + "/" + ASSETS_DIR + "/LobiSDKMenuValue.asset";

	private static IUpdateXcodeProject UpdateXodeProject = null;

	public string xcodeProjectPath = "";

	[MenuItem ("LobiSDK/Update Xcode Project...")]
	static void CreateWizard () {
		UpdateXodeProject = UpdateXcodeProjectFactory.Create();
		ScriptableWizard.DisplayWizard<LobiSDKMenu>("input xcode project path", "done");
	}
	
	void OnWizardCreate () {
		Debug.Log("OnWizardCreate" + xcodeProjectPath);
		if(!string.IsNullOrEmpty(xcodeProjectPath)){
			LobiSDKMenu.CreateAssetsDirctory();
			LobiSDKMenuValue menuValue = ScriptableObject.CreateInstance<LobiSDKMenuValue>();
			menuValue.xcodeProjectPath = xcodeProjectPath;
			AssetDatabase.CreateAsset(menuValue, ASSETS_PATH);
			UpdateXodeProject.OnWizardCreate(xcodeProjectPath);
		}
		else{

		}
	}

	private bool isFirstTime = true;
	void OnWizardUpdate () {
		if(isFirstTime){
			isFirstTime = false;
			helpString = "Please input Xcode Project Path";
			LobiSDKMenu.CreateAssetsDirctory();
			LobiSDKMenuValue value = AssetDatabase.LoadAssetAtPath(ASSETS_PATH, typeof(LobiSDKMenuValue)) as LobiSDKMenuValue;
			if(value != null){
				xcodeProjectPath = value.xcodeProjectPath;
			}
		}
	}

	private static void CreateAssetsDirctory(){
		if(!Directory.Exists(ASSETS_PARRENT)){
			Directory.CreateDirectory(ASSETS_PARRENT);
		}
		if(!Directory.Exists(ASSETS_PARRENT + "/" + ASSETS_DIR)){
			AssetDatabase.CreateFolder(ASSETS_PARRENT, ASSETS_DIR);
		}
	}
}
