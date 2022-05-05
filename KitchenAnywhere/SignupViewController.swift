//
//  SignupViewController.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-08.
//

import UIKit
import SwiftUI
import Firebase

class SignupViewController: UIViewController {

    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPostalcode: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtCPassword: UITextField!
    
    @IBOutlet weak var btnFoodie: UIButton!
    @IBOutlet weak var btnChef: UIButton!
    
    
    var fb = FirebaseUtil()
    var mainUtil = MainUtil()
    let _db = Firestore.firestore()
    // 0 = veg    ,  1 = nonveg
    var UserType = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITextField.appearance().tintColor = UIColor.black
        
        txtFullName.addTarget(self, action: #selector(SignupViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtEmail.addTarget(self, action: #selector(SignupViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtAddress.addTarget(self, action: #selector(SignupViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtPostalcode.addTarget(self, action: #selector(SignupViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtPhoneNo.addTarget(self, action: #selector(SignupViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtPassword.addTarget(self, action: #selector(SignupViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtCPassword.addTarget(self, action: #selector(SignupViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        
        mainUtil.RadioFillBorder(btn: btnFoodie)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func minimizePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func userSelectionPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            UserType = 0
            mainUtil.RadioFillBorder(btn: btnFoodie)
            mainUtil.RadioRemoveBorder(btn: btnChef)
        case 1:
            UserType = 1
            mainUtil.RadioFillBorder(btn: btnChef)
            mainUtil.RadioRemoveBorder(btn: btnFoodie)
        default:
            print("Default user type")
        }
        
    }
    
    
    @IBAction func SignUpPressed(_ sender: UIButton) {
        
        
        
        let allTextField = getTextfield(view: self.view)
            for txtField in allTextField
            {
                if txtField.text!.isEmpty{
                    MainUtil._Alert(self,"Signup Error", "All fields are mandatory!")
                    return
                }
            }

        
        if !MainUtil.isValidEmail(txtEmail.text!) {
            MainUtil._Alert(self,"Signup Error", "wrong email format!")
            return
        }
        
        if !MainUtil.isValidNumber(txtPhoneNo.text!){
            MainUtil._Alert(self,"Signup Error", "wrong phone number format! (514-134-1128)")
            return
        }
        
        print(txtPassword.text!.count)
        
        if txtPassword.text!.count < 6  {
            MainUtil._Alert(self,"Signup Error", "The password must be 6 characters long or more.")
            return
        }
        
        if txtPassword.text != txtCPassword.text{
            MainUtil._Alert(self,"Signup Error", "Confirm password does not match with password")
            return
        }
        
        
        FirebaseUtil.auth.createUser(withEmail: txtEmail.text!, password: txtPassword.text!, completion: { authResult, error in
            guard let user = authResult?.user, error == nil else {
                   print(error!.localizedDescription)
                    MainUtil._Alert(self,"Error!", error!.localizedDescription)
                   return
               }
        
            let userTypes:Bool = self.UserType == 0 ? false : true
            
            let newUser = ["address":self.txtAddress.text!,
                           "email":self.txtEmail.text!,
                           "fullName":self.txtFullName.text!,
                           "isChef":userTypes,
                           "phoneNo":self.txtPhoneNo.text!,
                           "postal_code":self.txtPostalcode.text?.uppercased(),
                           "userID":authResult?.user.uid,
                           "userStatus":"pending"
            ] as [String : Any]
            
            self._db.collection("User").document(authResult?.user.uid ?? "ABCD").setData(newUser as [String : Any])
            { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    let uialert = UIAlertController(title: "Success", message: "Now, you are regiested!", preferredStyle: UIAlertController.Style.alert)
                    uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: { action in
                            if(!userTypes){
                                self.loginFoodie(email: self.txtEmail.text!, password: self.txtPassword.text!)
                            }
                        }
                    ))
                    self.present(uialert, animated: true, completion: nil)
                    //Login the user if type is foodie
                    
                }
            }
            
        })
        
        
    }
    
    func loginFoodie(email:String,password:String){
        print("login foodie",email,password)
        FirebaseUtil.auth.signIn(withEmail: email, password: password) { [weak self]
            result, error in
            guard result != nil, error == nil else {
                print("erorr",error)
                let uialert = UIAlertController(title: "Login Error", message: "Pleasae enter correct password or email.", preferredStyle: UIAlertController.Style.alert)
                uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                self?.present(uialert, animated: true, completion: nil)
                return
            }
            
            self!.performSegue(withIdentifier: "gotoHomeScreenFromSignup", sender: self)

        }
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if (textField.text!.isEmpty)
        {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1
        }
        else
        {
            textField.layer.borderWidth = 0
            
        }
    }
    
    func getTextfield(view: UIView) -> [UITextField] {
        var results = [UITextField]()
        for subview in view.subviews as [UIView] {
            if let textField = subview as? UITextField {
                results += [textField]
            } else {
                results += getTextfield(view: subview)
            }
        }
        return results
    }
    
    func CleanForm(){
        txtFullName.text = ""
        txtEmail.text = ""
        txtAddress.text = ""
        txtPostalcode.text = ""
        txtPhoneNo.text = ""
        txtPassword.text = ""
        txtCPassword.text = ""
    }

}




