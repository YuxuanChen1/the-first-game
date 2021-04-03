using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Box : MonoBehaviour
{
    private int blood = 5;
    private void OnTriggerEnter2D(Collider2D collision)
    {
        int hurt = 0;
        if(collision.transform.tag == "Bullet")
        {
            hurt = collision.transform.GetComponent<Bullet>().hurt;
        }
        else if(collision.transform.tag == "Bullet_Enemy")
        {
            hurt = collision.transform.GetComponent<Bullet_enemy_1>().hurt;
        }
        blood -= hurt;
        if (blood <= 0)
        {
            Destroy(gameObject);
        }
    }
}
