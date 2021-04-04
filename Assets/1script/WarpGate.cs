using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class WarpGate : MonoBehaviour
{
    private void OnTriggerStay2D(Collider2D collision)
    {
        if(collision.tag == "Player")
        {
            if (Input.GetButton("Interaction"))
            {
                SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
            }
        }
    }
}
