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
    var fb = FirebaseUtil()
    
    @Published var signedIn = false
//    
//    @IBOutlet weak var passwordController: UITextField!
//    @IBOutlet weak var emailController: UITextField!
    
    @IBOutlet weak var passwordController: UITextField!
    @IBOutlet weak var emailController: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailController.text = "Np@gmail.com"
        passwordController.text = "Np@123"
        // Do any additional setup after loading the view.
    }

    @IBAction func Login(_ sender: UIButton) {
        
        
        var emailFromUI = (emailController.text != nil) ? emailController.text : ""
        
        
        var passwordFromUI = (passwordController.text != nil) ? passwordController.text : ""
        
        
        if emailController.text == "chef" && passwordController.text == "chef"
        {
            self.navigateToChefScreen()
        }
        else if emailController.text == "user" && passwordController.text == "user"
        {
            self.navigateToFoodieHomeScreen()
        }
        else if emailController.text == "admin" && passwordController.text == "admin"
        {
            self.navigateToAdminScreen()
        }
        else
        {
            loginWithFirebase(email: (emailController.text != nil) ? emailController.text! : "" , password: (passwordController.text != nil) ? passwordController.text! : "")
        }
     
        
    }
    
    func navigateToHomeScreen(){
        self.performSegue(withIdentifier: "goToHomeScreenBar", sender: self)
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
            print("uid",FirebaseUtil.auth.currentUser!.uid)
            self!.fb._db.collection("User").document(FirebaseUtil.auth.currentUser!.uid).getDocument { (docSnapshot, error) in
                        if let doc = docSnapshot {
                            let isChef:Bool = doc.get("isChef") as! Bool
                            
                            if(isChef){
                                
                                let userStatus:String = doc.get("userStatus") as! String
                                //Restrict chef user if profile is not approved
                                //userStatus{"approved","rejected","pending"}
                                if(userStatus == "approved" || !isChef){
                                    DispatchQueue.main.async {
                                        self?.signedIn = true
                                    }
                                    //Redirect user based on user type
                                    
                                    self?.navigateToChefScreen()
                                    
                                }else{
                                    MainUtil._Alert(self!, "Authorization", "Contact Admin at admin@kitchenanywhere.com to approve profile")
                                }
                                
                            }else{
                                self?.navigateToHomeScreen()
                            }
                            
                            
                        } else {
                            if let error = error {
                                print(error)
                            }
                        }
                    }
        }
        
    }
    
    
    @IBAction func signUp(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToSignup", sender: self)
    }
    
    
    func navigateToFoodieHomeScreen(){
        self.performSegue(withIdentifier: "goToHomeScreenBar", sender: self)
    }
    
    func navigateToChefScreen(){
        self.performSegue(withIdentifier: "goToChefHomeScreen", sender: self)
    }
    
    func navigateToAdminScreen(){
        self.performSegue(withIdentifier: "goToAdmin", sender: self)
    }
    
}

