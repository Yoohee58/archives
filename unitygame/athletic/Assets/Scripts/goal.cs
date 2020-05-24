using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class goal : MonoBehaviour
{
    // Start is called before the first frame update
    public MeshRenderer mr;
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
    }
        
    void OnCollisionEnter(Collision col) {
        mr.material.color = new Color(1f,0f,0f);
    }

   
}
