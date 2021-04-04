using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpikeweedHurt : MonoBehaviour
{
    private float cooltime = 1f;
    void Update()
    {
        cooltime -= Time.deltaTime;
    }
    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (cooltime <= 0f)
        {
            if (collision.tag == "Player" || collision.tag == "Enemy")
            {
                if (collision.tag == "Player")
                {
                    if (collision.gameObject.GetComponent<PlayerController>().armor > 0)
                    {
                        collision.gameObject.GetComponent<PlayerController>().armor -= 1;
                    }
                    else
                    {
                        collision.gameObject.GetComponent<PlayerController>().blood -= 1;
                    }
                }
                else
                {
                    collision.gameObject.GetComponent<EnemyController>().blood -= 1;
                }
            }
            cooltime = 1f;
        }
    }
}
