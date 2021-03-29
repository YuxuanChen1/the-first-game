using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Weapon : MonoBehaviour
{
    public Transform firePoint;
    public GameObject bulletPrefab;
    public bool isOnPlayer;


    void Update()
    {
        if (isOnPlayer && Input.GetMouseButtonDown(0))
        {
            Shoot();
        }
    }

    void Shoot()
    {
        //生成子弹
        Instantiate(bulletPrefab, firePoint.position, firePoint.rotation);
    }
}
