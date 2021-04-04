using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DeathCamera : MonoBehaviour
{
    public GameObject playData;
    void Start()
    {
        playData = GameObject.Find("PlayerData");
        if (playData)
        {
            Destroy(playData);
        }
    }
}
