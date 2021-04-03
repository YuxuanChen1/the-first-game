using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlayerController : MonoBehaviour
{
    private Rigidbody2D rb;
    private Animator anim;
    private GameObject weapon_skill;
    public GameObject weapon;
    public GameObject deathPrefab;

    private float skillTime;
    private float skillCooltime = 0f;
    private float faceRight = 1;
    private bool death = false;
    public int blood = 5;
    public int maxBlood = 5;
    public int armor = 5;//护甲
    public int maxArmor = 5;
    public float cooldown = 5f;//护甲回复冷却
    public float speed;
    public float energy = 180f;
    public int maxEnergy = 180;
    public int gold = 0;
    public bool skilling = false;
    
    
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
        if (death)
        {
            return;
        }

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

    private void OnTriggerEnter2D(Collider2D collision)
    {
        //受到武器伤害
        if (collision.tag == "Bullet_Enemy" || collision.tag == "Bucktooth")
        {
            GetHurt(collision);
        }
        //拾取物品
        else if(collision.tag == "Collection_Energy")
        {
            if(energy < maxEnergy-7)
            {
                energy += 8;
            }
        }
        else if(collision.tag == "Collection_Gold")
        {
            gold += 1;
        }
        
    }


    #region 受到武器伤害
    void GetHurt(Collider2D collision)
    {
        int hurt = 0;
        if (collision.transform.tag == "Bullet_Enemy")
        {
            hurt = collision.transform.GetComponent<Bullet_enemy_1>().hurt;
        }
        else if (collision.transform.tag == "Bucktooth")
        {
            hurt = collision.transform.GetComponent<Bucktooth>().hurt;
        }

        if (hurt != 0)
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
        if (blood <= 0 && !death)
        {
            death = true;
            blood = 0;
            Death();
        }
    }
    #endregion

    #region 死亡
    void Death()
    {
        Instantiate(deathPrefab, transform.position, transform.rotation);
        Invoke("OpenDeathMenu", 2f);
        gameObject.GetComponent<SpriteRenderer>().sortingLayerName = "DeathPlayer";
        gameObject.GetComponent<BoxCollider2D>().isTrigger = true;
    }
    #endregion

    #region 护甲回复
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
    #endregion

    #region 技能
    //判断是否使用技能
    void Skill()
    {
        skillTime -= Time.deltaTime;
        skillCooltime -= Time.deltaTime;
        if (Input.GetMouseButtonDown(1) && skillCooltime <= 0)
        {
            skilling = true;
            UseSkill();
        }
        if (skillTime <= 0 && weapon_skill)
        {
            skilling = false;
            Destroy(weapon_skill);
            skillCooltime = 30f;
        }
    }
    //使用技能
    void UseSkill()
    {
        skillTime = 5f;
        weapon_skill = Instantiate(weapon, transform.position, transform.rotation,transform);
        weapon_skill.GetComponent<SpriteRenderer>().sortingOrder = 0;
    }
    #endregion

    //跳转到死亡菜单
    void OpenDeathMenu()
    {
        SceneManager.LoadScene("DeathMenu");
    }
}
