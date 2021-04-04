using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpikeweedController : MonoBehaviour
{
    public GameObject spikeweed;

    private float cooltime = 5f;
    private float continueTime = 3f;
    private bool isArise;

    void Update()
    {
        if (!isArise)
        {
            cooltime -= Time.deltaTime;
            if (cooltime <= 0f)
            {
                spikeweed.SetActive(true);
                isArise = true;
                continueTime = 3f;
            }
        }
        else
        {
            continueTime -= Time.deltaTime;
            if (continueTime <= 0f)
            {
                spikeweed.SetActive(false);
                isArise = false;
                cooltime = 5f;
            }
        }
    }
}
