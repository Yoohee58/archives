using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class player : MonoBehaviour
{
    // Start is called before the first frame update
    public Rigidbody rb;
    public Text goalText;
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKey(KeyCode.A)){
            transform.Translate(-3f*Time.deltaTime,0f,0f);
            //transform.Rotate(0f,-15f,0f);
        }
        if(Input.GetKey(KeyCode.D)){
            transform.Translate(3f*Time.deltaTime,0f,0f);
            //transform.Rotate(0f,15f,0f);
        }
        if(Input.GetKey(KeyCode.W)){
            transform.Translate(0f,0f,3f*Time.deltaTime);
        }
        if(Input.GetKey(KeyCode.S)){
            transform.Translate(0f,0f,-3f*Time.deltaTime);
        }
        if(Input.GetKeyDown(KeyCode.Space)){
            rb.AddForce(0f,100f,0f);
        }
        if(transform.position.y < -5f){
            //transform.position = new Vector3(0f,0f,0f);
            //goalText.text = "GameOver";
            SceneManager.LoadScene("Game");

        }
    }

    void OnCollisionEnter(Collision col) {
        if (col.gameObject.name == "Jump"){
            rb.AddForce(0f,100f,0f);
        }
        if (col.gameObject.name == "goal"){
            goalText.text = "Goal";
        }
        
    }
}
