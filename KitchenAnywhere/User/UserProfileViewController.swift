//
//  UserProfileViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-05-11.
//

import UIKit
import Firebase

class UserProfileViewController: UIViewController {

    let FB = FirebaseUtil()
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var txtPostalCode: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtUserType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LoadUserData()
    }
    
    func LoadUserData(){
        
        FB._readDocumentWithId(_collection: "User", _docId: Auth.auth().currentUser!.uid) { QuerySnapshot in
            self.txtUserName.text = QuerySnapshot["fullName"] as! String
            self.txtEmail.text = QuerySnapshot["email"] as! String
            self.txtPhoneNo.text = QuerySnapshot["phoneNo"] as! String
            self.txtPostalCode.text = QuerySnapshot["postal_code"] as! String
            self.txtAddress.text = QuerySnapshot["address"] as! String
            self.txtPostalCode.text = QuerySnapshot["postal_code"] as! String
            self.txtUserType.text = QuerySnapshot["isChef"] as! Bool == false ? "Hey Foodie" : "Hey Chef"
        }
        
    }
    
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        let allTextField = MainUtil.getTextfield(view: self.view)
            for txtField in allTextField
            {
                if txtField.text!.isEmpty{
                    MainUtil._Alert(self,"Error", "All fields are mandatory!")
                    return
                }
            }
        
        if !MainUtil.isValidNumber(txtPhoneNo.text!){
            MainUtil._Alert(self,"Error", "wrong phone number format! (Ex: 514-134-1128)")
            return
        }
        
        let newUser = ["address":self.txtAddress.text!,
                       "phoneNo":self.txtPhoneNo.text!,
                       "postal_code":self.txtPostalCode.text?.uppercased()
        ] as [String : Any]
        
        FB._updateExistingFieldInDocumentWithId(_collection: "User", _docId: Auth.auth().currentUser!.uid, _data: newUser)
        
        MainUtil._Alert(self,"Congrats", "Information has been Updated!")
        
        
    }
    
    

}
