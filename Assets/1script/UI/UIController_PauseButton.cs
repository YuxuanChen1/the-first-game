using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class UIController_PauseButton : MonoBehaviour
{
    public GameObject pauseMenu;
    public void OpenPauseMenu()
    {
        Time.timeScale = 0f;
        pauseMenu.SetActive(true);
    }
}
