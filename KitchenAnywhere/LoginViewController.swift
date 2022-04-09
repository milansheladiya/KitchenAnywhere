//
//  ViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-03-29.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUp(_ sender: UIButton) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
}

