using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class UIController_WinMenu : MonoBehaviour
{
    public void SwicthToMainMenu()
    {
        SceneManager.LoadScene("MainMenu");
    }
}
