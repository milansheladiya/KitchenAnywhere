//
//  ViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-03-29.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    let auth = Auth.auth()
    
    @Published var signedIn = false
//    
//    @IBOutlet weak var passwordController: UITextField!
//    @IBOutlet weak var emailController: UITextField!
    
    @IBOutlet weak var passwordController: UITextField!
    @IBOutlet weak var emailController: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Login(_ sender: UIButton) {
        
        
        var emailFromUI = (emailController.text != nil) ? emailController.text : ""
        
        
        var passwordFromUI = (passwordController.text != nil) ? passwordController.text : ""
        
        loginWithFirebase(email: (emailController.text != nil) ? emailController.text! : "" , password: (passwordController.text != nil) ? passwordController.text! : "")
        
        
        
        
    }
    
    func navigateToHomeScreen(){
        
//        self.performSegue(withIdentifier: "goToCFDishList", sender: self)
        
        // for screen add dish
//        self.performSegue(withIdentifier: "goToAddDish", sender: self)
        
        self.performSegue(withIdentifier: "goToViewOrder", sender: self)
        
        
//        self.performSegue(withIdentifier: "goToHomeScreen", sender: self)
    }
    
    
    func loginWithFirebase(email: String , password: String)
    {
        
        auth.signIn(withEmail: email, password: password) { [weak self]
            result, error in
            guard result != nil, error == nil else {
                
                let uialert = UIAlertController(title: "Login Error", message: "Pleasae enter correct password or email.", preferredStyle: UIAlertController.Style.alert)
                      uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                   self?.present(uialert, animated: true, completion: nil)
                
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
//            let storyboard = self?.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
//            self?.navigationController?.pushViewController(storyboard, animated: true)

            self?
                .navigateToHomeScreen()

        }
        
    }
    
    
    @IBAction func signUp(_ sender: UIButton) {
//        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
//        self.navigationController?.pushViewController(storyboard, animated: true)
        
        self.navigateToHomeScreen()
        
        
    }
    
}

