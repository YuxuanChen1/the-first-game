using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DoorController : MonoBehaviour
{
    public MapController mapController;
    public GameObject[] door;
    

    void Update()
    {
        if(mapController.player && mapController.enemy)
        {
            gameObject.GetComponent<BoxCollider2D>().isTrigger = false;
            for(int i = 0; i < door.Length; i++)
            {
                door[i].SetActive(true);
            }
        }
        else
        {
            gameObject.GetComponent<BoxCollider2D>().isTrigger = true;
            for (int i = 0; i < door.Length; i++)
            {
                door[i].SetActive(false);
            }
        }
    }

    
}
