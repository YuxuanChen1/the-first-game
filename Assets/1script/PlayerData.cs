using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerData : MonoBehaviour
{
    public GameObject player;
    public PlayerController playerData;
    public int blood = 5;
    public float energy = 180f;
    public int armor = 5;
    public int gold = 0;

    

    // Start is called before the first frame update
    void Start()
    {
        GameObject.DontDestroyOnLoad(gameObject);
        player = GameObject.Find("Player");
    }

    // Update is called once per frame
    void Update()
    {
        if (player)
        {
            playerData = player.GetComponent<PlayerController>();
            blood = playerData.blood;
            energy = playerData.energy;
            armor = playerData.armor;
            gold = playerData.gold;
        }
    }
}
