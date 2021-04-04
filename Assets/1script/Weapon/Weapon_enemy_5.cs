using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Weapon_enemy_5 : MonoBehaviour
{
    public GameObject[] firePoint;
    public GameObject bulletPrefab;
    public float totalTime = 5f;
    private float time = 0;
    private float distance;
    private GameObject player;

    private void Start()
    {
        player = GameObject.Find("Player");
    }

    private void Update()
    {
        distance = (player.transform.position - transform.position).sqrMagnitude;
        time -= Time.deltaTime;

        if (distance < 180f && time <= 0f)
        {
            bool notFire = Physics2D.Raycast(transform.position, player.transform.position - transform.position, Mathf.Sqrt(distance), 1 << LayerMask.NameToLayer("Wall"));
            if (!notFire)
            {
                for (int i = 0; i < firePoint.Length; i++)
                {
                    Instantiate(bulletPrefab, firePoint[i].transform.position, firePoint[i].transform.rotation);
                }
                time = totalTime;
            }
        }
    }
}
