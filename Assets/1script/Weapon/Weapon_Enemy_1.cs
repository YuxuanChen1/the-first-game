using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Weapon_Enemy_1 : MonoBehaviour
{
    public Transform firePoint;
    public GameObject bulletPrefab;
    private Transform player;
    public float fireDistance = 70f;

    private float totalTime = 2f;

    void Start()
    {
        player = GameObject.Find("Player").transform;
    }
    void Update()
    {
        RotateWeaponForEnemy();

        //Vector2 positionOfPlayer = player.position;
        float distanceFromEnemyToPlayer = (transform.position - player.position).sqrMagnitude;
        if (distanceFromEnemyToPlayer < fireDistance)
        {
            //射线检测
            bool notFire = Physics2D.Raycast(transform.position, player.position - transform.position, Mathf.Sqrt(distanceFromEnemyToPlayer), 1 << LayerMask.NameToLayer("Wall"));
            if (!notFire)
            {
                //开火
                totalTime -= Time.deltaTime;
                if (totalTime <= 0)
                {
                    Shoot();
                    Invoke("Shoot", 0.5f);
                    //todo:计时结束
                    totalTime = 2f;
                }
            }
        }
        
    }

    void Shoot()
    {
        //生成子弹
        Instantiate(bulletPrefab, firePoint.position, firePoint.rotation);
    }

    //旋转武器
    void RotateWeaponForEnemy()
    {
        Vector2 direction = player.position - transform.position;
        float angle = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
        transform.rotation = Quaternion.AngleAxis(angle, Vector3.forward);
    }
}
