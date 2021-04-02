using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour
{
    private Transform player;
    private Rigidbody2D rb;
    private Animator anim;
    public GameObject deathPrefab;
    public GameObject energyPrefab;
    public GameObject goldPrefab;

    private float DistanceToPlayer;
    private float totalTime = 0.5f;
    private bool keepAway = false;
    private float keepAwayTime = 0.5f;
    public float speed = 5f;
    public float patrolDistance = 35;//巡逻范围
    public int blood = 5;

    void Start()
    {
        player = GameObject.Find("Player").transform;
        rb = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
    }
    void Update()
    {
        Movement();
        AnimSwicth();
    }
    #region 移动逻辑
    void Movement()
    {
        //敌人朝向
        if (rb.velocity.x > 0)
        {
            transform.localScale = new Vector3(1, 1, 1);
        }
        else if (rb.velocity.x < 0)
        {
            transform.localScale = new Vector3(-1, 1, 1);
        }


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
            FollowAndAttackPlayer(keepAway);
        }
    }
    #endregion

    #region 动画切换
    void AnimSwicth()
    {
        if (Mathf.Abs(rb.velocity.x) + Mathf.Abs(rb.velocity.y) > 0.1f)
        {
            anim.SetBool("moving", true);
        }
        else
        {
            anim.SetBool("moving", false);
        }
    }
    #endregion

    #region 追击
    void FollowAndAttackPlayer(bool keepAway)
    {
        if (!keepAway)
        {
            Vector2 direction = player.gameObject.transform.position - transform.position;
            direction = direction.normalized * speed;
            rb.velocity = direction;
        }
        else
        {
            KeepAway();
        }
    }
    #endregion

    #region 巡逻
    void Patrol()
    {
        keepAway = false;
        totalTime -= Time.deltaTime;
        if(totalTime <= 0.5f)
        {
            rb.velocity = new Vector2(0, 0);
        }
        if (totalTime <= 0f)
        {
            totalTime = 1.25f;
            Vector2 destination = new Vector2(Random.Range(transform.position.x - 5f, transform.position.x + 5f), Random.Range(transform.position.y - 5f, transform.position.y + 5f));
            Vector2 direction = destination - rb.position;
            direction = direction.normalized;
            rb.velocity = direction * speed;
            //rb.velocity = new Vector2(0, 0);
        }
    }
    #endregion

    #region 巡逻时如果撞墙，速度为0 追击时如果撞到玩家，远离一段距离
    
    private void OnCollisionEnter2D(Collision2D collision)
    {
        if(collision.gameObject.transform.tag == "Wall")
        {
            rb.velocity = new Vector2(0f, 0f);
        }
        else if(collision.gameObject.transform.tag == "Player")
        {
            keepAway = true;
        }
    }
    #endregion

    #region 受到伤害
    private void OnTriggerEnter2D(Collider2D collision)
    {
        //武器伤害
        if (collision.tag == "Bullet")
        {
            int hurt = collision.transform.GetComponent<Bullet>().hurt;
            blood -= hurt;
            if (blood <= 0)
            {
                Death();
            }
        }
    }
    #endregion

    #region 远离玩家
    void KeepAway()
    {
        keepAwayTime -= Time.deltaTime;
        if (keepAwayTime < 0f)
        {
            keepAway = false;
            keepAwayTime = 0.5f;
        }
        if (keepAwayTime > 0.49f) 
        {
            Vector2 destination = new Vector2(Random.Range(transform.position.x - 5f, transform.position.x + 5f), Random.Range(transform.position.y - 5f, transform.position.y + 5f));
            Vector2 direction = destination - rb.position;
            direction = direction.normalized;
            rb.velocity = direction * speed;
        }
        
    }
    #endregion

    #region 死亡
    void Death()
    {
        //生成掉落物
        DropGeneration();

        //在敌人的位置创建一个死亡的预制体
        Instantiate(deathPrefab, transform.position, transform.rotation);

        Destroy(gameObject);
    }

    void DropGeneration()
    {
        if (Random.Range(0f, 10f) <= 5) {
            float x1 = Random.Range(transform.position.x - 1f, transform.position.x + 1f);
            float y1 = Random.Range(transform.position.y - 1f, transform.position.y + 1f);
            Vector3 position = new Vector3(x1, y1, 0f);
            Instantiate(goldPrefab, position, transform.rotation);
        }
        if (Random.Range(0f, 10f) <= 5)
        {
            float x1 = Random.Range(transform.position.x - 1f, transform.position.x + 1f);
            float y1 = Random.Range(transform.position.y - 1f, transform.position.y + 1f);
            Vector3 position = new Vector3(x1, y1, 0f);
            Instantiate(energyPrefab, position, transform.rotation);
        }
    }
    #endregion

}
