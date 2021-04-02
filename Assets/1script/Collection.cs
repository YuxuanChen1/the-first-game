using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Collection : MonoBehaviour
{
    private GameObject Player;
    private Rigidbody2D rb;
    private float maxDistance = 15;
    private float distance;
    private float speed = 10f;
    private bool followThePlayer = false;
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        Player = GameObject.Find("Player");
    }

    void Update()
    {
        distance = (transform.position - Player.transform.position).sqrMagnitude;
        if (followThePlayer)
        {
            Follow();
        }
        else if (distance < maxDistance)
        {
            followThePlayer = true;
        }
    }

    void Follow()
    {
        Vector3 direction = Player.transform.position - transform.position;
        direction = direction.normalized;
        rb.velocity = direction * speed;
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if(collision.gameObject.tag == "Player")
        {
            Destroy(gameObject);
        }
    }
}
