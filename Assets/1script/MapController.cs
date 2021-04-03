using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MapController : MonoBehaviour
{
    public bool player = false;
    public bool enemy = true;
    public GameObject[] enemys;
    public bool fighting = false;
    public GameObject treasureBox;

    private void Update()
    {
        if (enemy)
        {
            IsEnemy();
        }
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if(collision.tag == "Player")
        {
            fighting = true;
            player = true;
            if (enemy)
            {
                for (int i = 0; i < enemys.Length; i++)
                {
                    enemys[i].GetComponent<EnemyController>().speed = enemys[i].GetComponent<EnemyController>().ratedSpeed;
                }
            }
        }
    }

    //检测是否还有敌人
    void IsEnemy()
    {
        enemy = false;
        //int enemyNum = 0;
        for(int i = 0; i < enemys.Length; i++)
        {
            //enemyNum += 1;
            if (enemys[i])
            {
                enemy = true;
                return;
            }
        }
        CreateTreasureBox();
    }

    void CreateTreasureBox()
    {
        float x = Random.Range(transform.position.x - 5f, transform.position.x + 5f);
        float y = Random.Range(transform.position.y - 5f, transform.position.y + 5f);
        Vector2 position = new Vector2(x, y);
        Instantiate(treasureBox, position, transform.rotation);
    }
}
