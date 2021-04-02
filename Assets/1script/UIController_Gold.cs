using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIController_Gold : MonoBehaviour
{
    private PlayerController player;
    public Text gold;
    void Start()
    {
        player = GameObject.Find("Player").GetComponent<PlayerController>();
    }

    // Update is called once per frame
    void Update()
    {
        int goldNum = player.gold;
        gold.text = goldNum.ToString();
    }
}
