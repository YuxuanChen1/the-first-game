using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    private Rigidbody2D rb;
    private Animator anim;

    public float speed;
    private float faceRight = 1;
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
    }

    void Update()
    {
        Movement();
        AnimSwicth();
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
}
