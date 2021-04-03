using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIController_Information : MonoBehaviour
{
    private GameObject player;

    public Text blood;
    public Text armor;
    public Text energy;
    public Slider slider_blood;
    public Slider slider_armor;
    public Slider slider_energy;

    private PlayerController player_Script;
    
    // Start is called before the first frame update
    void Start()
    {
        player = GameObject.Find("Player");
        player_Script = player.GetComponent<PlayerController>();
    }

    // Update is called once per frame
    void Update()
    {
        slider_blood.maxValue = player_Script.maxBlood;
        slider_armor.maxValue = player_Script.maxArmor;
        slider_energy.maxValue = player_Script.maxEnergy;

        slider_blood.value = player_Script.blood;
        slider_armor.value = player_Script.armor;
        slider_energy.value = player_Script.energy;


        blood.text = $"{player_Script.blood}/{player_Script.maxBlood}";
        armor.text = $"{player_Script.armor}/{player_Script.maxArmor}";
        energy.text = $"{(int)player_Script.energy}/{player_Script.maxEnergy}";
    }
}
