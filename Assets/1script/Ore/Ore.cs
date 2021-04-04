using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ore : MonoBehaviour
{
    public GameObject borkenOre;
    public GameObject ore;
    public int blood = 20;

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if(collision.tag == "Bullet")
        {
            blood -= collision.gameObject.GetComponent<Bullet>().hurt;
            if (blood <= 0)
            {
                float x, y;
                for(int i = 0; i < 10; i++)
                {
                    x = Random.Range(transform.position.x - 3f, transform.position.x + 3f);
                    y = Random.Range(transform.position.y - 3f, transform.position.y + 3f);
                    Vector2 position = new Vector2(x, y);
                    Instantiate(ore, position, transform.rotation);
                }

                Instantiate(borkenOre, transform.position, transform.rotation);
                Destroy(gameObject);
            }
        }
    }
}
