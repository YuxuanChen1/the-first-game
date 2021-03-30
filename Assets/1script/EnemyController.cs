using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour
{
    private Rigidbody2D rb;
    private Animator anim;

    private float DistanceToPlayer;
    public Transform player;
    public float speed;
    public float patrolDistance;//巡逻范围
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
    }

    void Update()
    {
        Movement();
    }
    
    void Movement()
    {
        DistanceToPlayer = (transform.position - player.position).sqrMagnitude;
        if (DistanceToPlayer > patrolDistance)
        {
            //巡逻代码
            rb.velocity = new Vector2(0, 0);
        }
        else
        {
            //追击代码
            //FollowAndAttackPlayer();
        }
    }

    //追击
    void FollowAndAttackPlayer()
    {
        
        Vector2 direction = player.gameObject.transform.position - transform.position;
        direction = direction.normalized * speed; ;
        rb.velocity = direction;
    }
}
