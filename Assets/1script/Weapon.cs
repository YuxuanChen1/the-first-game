using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Weapon : MonoBehaviour
{
    public Transform firePoint;
    public GameObject bulletPrefab;
    public bool isOnPlayer;
    public Transform player;
    public float fireDistance;

    private Vector3 mousePosition;
    private float totalTime = 1f;


    void Update()
    {
        if (isOnPlayer)
        {
            RotateWeaponForPlayer();
            //开枪
            if (isOnPlayer && Input.GetMouseButtonDown(0))
            {
                Shoot();
            }
        }
        else
        {
            //武器在敌人手上
            RotateWeaponForEnemy();
            Vector2 positionOfPlayer = player.position;
            float distanceFromEnemyToPlayer = (transform.position - player.position).sqrMagnitude;
            if (distanceFromEnemyToPlayer < fireDistance)
            {
                //射线检测
                Ray ray = new Ray(transform.position, player.position - transform.position);
                
                if(!Physics.Raycast(ray,distanceFromEnemyToPlayer,LayerMask.GetMask("Bullet_ignore")))
                {
                    //开火
                    totalTime -= Time.deltaTime;
                    if (totalTime <= 0)
                    {
                        Shoot();
                        //todo:计时结束
                        totalTime = 1f;
                    }
                    
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
    void RotateWeaponForPlayer()
    {
        //获取鼠标的坐标，鼠标是屏幕坐标，Z轴为0，这里不做转换 
        mousePosition = Input.mousePosition;
        //获取物体坐标，物体坐标是世界坐标，将其转换成屏幕坐标，和鼠标一直 
        Vector3 obj = Camera.main.WorldToScreenPoint(transform.position);
        //屏幕坐标向量相减，得到指向鼠标点的目标向量
        Vector3 direction = mousePosition - obj;
        //将Z轴置0,保持在2D平面内
        direction.z = 0f;
        //将目标向量长度变成1，即单位向量，这里的目的是只使用向量的方向，不需要长度，所以变成1 
        direction = direction.normalized;
        //调整角度
        float temp = direction.x;
        direction.x = -direction.y;
        direction.y = temp;
        //物体自身的Y轴和目标向量保持一直，这个过程XY轴都会变化数值 
        transform.up = direction;
    }

    void RotateWeaponForEnemy()
    {
        Vector2 direction = player.position - transform.position;
        float angle = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
        transform.rotation = Quaternion.AngleAxis(angle, Vector3.forward);
    }
}
