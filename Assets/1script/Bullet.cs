using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    public float speed = 20f;
    public Rigidbody2D rb;
    public int hurt = 2;
    private Animator anim;
    void Start()
    {
        rb.velocity = transform.right * speed;
        anim = GetComponent<Animator>();
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        //与collision发生接触（Wall  Enemy   Destroy）
        if(collision.gameObject.tag == "Wall")
        {
            //切换爆炸效果
            anim.SetBool("boom", true);
            //速度为0
            rb.velocity = new Vector2(0, 0);
        }
        else if(collision.gameObject.tag == "Enemy")
        {
            rb.velocity = new Vector2(0, 0);
            anim.SetBool("boom", true);
        }
        else if(collision.gameObject.tag == "Destroy")
        {
            rb.velocity = new Vector2(0, 0);
            anim.SetBool("boom", true);
        }
    }

    //销毁子弹
    void Delete()
    {
        Destroy(gameObject);
    }
}
