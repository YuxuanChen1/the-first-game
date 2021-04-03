using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TreasureBoxController : MonoBehaviour
{
    public GameObject treasureBox_1;
    public GameObject treasureBox_2;
    public GameObject goldPrefab;
    public GameObject energyPrefab;
    private void OnTriggerStay2D(Collider2D collision)
    {
        if(collision.tag == "Player")
        {
            if (Input.GetButton("Interaction"))
            {
                treasureBox_1.SetActive(false);
                treasureBox_2.SetActive(true);

                float x, y;
                Vector2 position;
                for (int i = 0; i < 2; i++)
                {
                    x = Random.Range(transform.position.x - 2f, transform.position.x + 2f);
                    y = Random.Range(transform.position.y - 2f, transform.position.y + 2f);
                    position = new Vector2(x, y);
                    Instantiate(goldPrefab, position, transform.rotation);
                }
                for (int i = 0; i < 2; i++)
                {
                    x = Random.Range(transform.position.x - 2f, transform.position.x + 2f);
                    y = Random.Range(transform.position.y - 2f, transform.position.y + 2f);
                    position = new Vector2(x, y);
                    Instantiate(energyPrefab, position, transform.rotation);
                }
            }
        }
    }
}
