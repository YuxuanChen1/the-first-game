using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController: MonoBehaviour
{
    private Transform player;
    void Update()
    {
        player = GameObject.Find("Player").transform;
        transform.position = new Vector3(player.position.x, player.position.y, -10f);
    }
}
