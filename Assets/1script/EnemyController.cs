using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour
{
    private Rigidbody2D rb;
    private Animator anim;
    public GameObject deathPrefab;

    private float DistanceToPlayer;
    private float totalTime = 0.5f;
    public Transform player;
    public float speed;
    public float patrolDistance;//巡逻范围
    public int blood = 5;

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
        bool notFire = Physics2D.Raycast(transform.position, player.position - transform.position, Mathf.Sqrt(DistanceToPlayer), 1 << LayerMask.NameToLayer("Wall"));
        //巡逻范围外或之间有墙阻挡
        if (DistanceToPlayer > patrolDistance || notFire)
        {
            //巡逻代码
            Patrol();
        }
        else
        {
            //追击代码
            FollowAndAttackPlayer();
        }
    }
    //追击
    void FollowAndAttackPlayer()
    {
        
        Vector2 direction = player.gameObject.transform.position - transform.position;
        direction = direction.normalized * speed; 
        rb.velocity = direction;
    }
    //巡逻
    void Patrol()
    {
        totalTime -= Time.deltaTime;
        if (totalTime <= 0f)
        {
            totalTime = 0.75f;
            Vector2 destination = new Vector2(Random.Range(transform.position.x - 5f, transform.position.x + 5f), Random.Range(transform.position.y - 5f, transform.position.y + 5f));
            Vector2 direction = destination - rb.position;
            direction = direction.normalized;
            rb.velocity = direction * speed;
            //rb.velocity = new Vector2(0, 0);
        }
    }
    //巡逻时如果撞墙，速度为0
    private void OnCollisionEnter2D(Collision2D collision)
    {
        if(collision.gameObject.transform.tag == "Wall")
        {
            rb.velocity = new Vector2(0f, 0f);
        }
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        //武器伤害
        if (collision.tag == "Bullet")
        {


            blood -= 2;//??
            if (blood <= 0)
            {
                //在敌人的位置创建一个死亡的预制体
                Instantiate(deathPrefab, transform.position, transform.rotation);
                Destroy(gameObject);
            }
        }
    }
}
