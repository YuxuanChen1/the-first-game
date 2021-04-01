using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private Rigidbody2D rb;
    private Animator anim;
    public GameObject weapon;
    private GameObject weapon_skill;
    private float skillTime;
    private float skillCooltime;

    public float speed;
    private float faceRight = 1;
    [SerializeField] private int blood = 5;
    private int maxArmor = 5;
    [SerializeField] private int armor = 5;//护甲
    [SerializeField] private float cooldown = 5f;//护甲回复冷却
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
    }

    void Update()
    {
        Movement();
        AnimSwicth();
        Recovery();
        Skill();
    }

    void Movement()
    {
        float horizontalMove = Input.GetAxis("Horizontal");
        float verticalMove = Input.GetAxis("Vertical");

        //角色朝向
        float direction = Input.GetAxisRaw("Horizontal");
        
        if(direction != 0 && faceRight != direction)
        {
            //transform.localScale = new Vector3(faceDirection, 1, 1);
            transform.Rotate(0, 180f, 0);
            faceRight *= -1;
        }

        //角色移动
        if (horizontalMove != 0 && verticalMove != 0)
        {
            rb.velocity = new Vector2(horizontalMove * 0.8f * speed, verticalMove * 0.8f * speed);
        }
        else if(horizontalMove != 0 && verticalMove == 0)
        {
            rb.velocity = new Vector2(horizontalMove * speed, rb.velocity.y);
        }
        else if(horizontalMove == 0 && verticalMove != 0)
        {
            rb.velocity = new Vector2(rb.velocity.x, verticalMove * speed);
        }
    }

    void AnimSwicth()
    {
        if(Mathf.Abs(rb.velocity.x) < 0.1f && Mathf.Abs(rb.velocity.y) < 0.1f)
        {
            anim.SetBool("running", false);
        }
        else
        {
            anim.SetBool("running", true);
        }
    }

    //受到武器伤害
    private void OnTriggerEnter2D(Collider2D collision)
    {
        int hurt = 0;
        if(collision.transform.tag == "Bullet_Enemy")
        {
            hurt = collision.transform.GetComponent<Bullet_enemy_1>().hurt;
        }
        else if(collision.transform.tag == "Bucktooth")
        {
            hurt = collision.transform.GetComponent<Bucktooth>().hurt;
        }

        if(hurt != 0)
        {
            cooldown = 5f;
        }

        if (armor >= hurt)
        {
            armor -= hurt;
        }
        else
        {
            blood -= hurt - armor;
            armor = 0;
        }
        if (blood <= 0)
        {
            blood = 0;
            Death();
        }
    }

    //死亡
    void Death()
    {
        //
    }

    //护甲回复
    void Recovery()
    {
        cooldown -= Time.deltaTime;
        if (cooldown <= 0f)
        {
            if (armor < maxArmor)
            {
                armor += 1;
            }
            cooldown = 1f;
        }
    }

    void Skill()
    {
        skillTime -= Time.deltaTime;
        skillCooltime -= Time.deltaTime;
        if (Input.GetMouseButtonDown(1) && skillCooltime <= 0)
        {
            UseSkill();
        }
        if (skillTime <= 0 && weapon_skill)
        {
            Destroy(weapon_skill);
            skillCooltime = 30f;
        }
    }

    void UseSkill()
    {
        skillTime = 5f;
        weapon_skill = Instantiate(weapon, transform.position, transform.rotation,transform);
        weapon_skill.GetComponent<SpriteRenderer>().sortingOrder = 0;
    }
}
