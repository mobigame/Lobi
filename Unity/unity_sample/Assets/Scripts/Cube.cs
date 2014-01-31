using UnityEngine;
using System.Collections;

public class Cube : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		Vector3 rotation = transform.localEulerAngles;
		rotation.y++;
		rotation.z++;
		transform.localEulerAngles = rotation;
	}
}
