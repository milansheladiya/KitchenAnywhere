//
//  CFAddDishViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-20.
//

import UIKit
import SwiftUI
import FirebaseFirestore
import FirebaseStorage
import UniformTypeIdentifiers


class CFAddDishViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var callbackClosure : (() -> Void)?
    
    override func viewWillDisappear(_ animated: Bool){
        callbackClosure?()
    }
    
    let fb = FirebaseUtil()
    
    var isEdit:Bool = false
    var dish_ :Dish? = nil
    
    var txtTitle_:String = "apple"
    var txtPrice_:String = "2.5"
    var txtType_:String = "Veg"
    var txtCusine_:String = "Asian"
    var txtStatus_:String = "Active"
    var txtQty_:String = "5"
    var txtDescription_:String = "all is wll"
    var imgURL:String = "https://firebasestorage.googleapis.com/v0/b/kitchenanywhere-84ad5.appspot.com/o/splashMainLogo.png?alt=media&token=693ad5fe-45d4-4db4-975e-40026a249530"

    @IBOutlet weak var txtDishTitle: UITextField!
    
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var btnUploadImage: UIButton!
    
    @IBOutlet weak var txtPricePerDish: UITextField!
    @IBOutlet weak var rdbVegetarian: UIButton!
    @IBOutlet weak var rdbNonvegetarian: UIButton!
    
    @IBOutlet weak var txtCusine: UITextField!
    
    @IBOutlet weak var rdbActive: UIButton!
    @IBOutlet weak var rdbDeactive: UIButton!
    
    @IBOutlet weak var txtQuantityPerDay: UITextField!
    @IBOutlet weak var stepperQuantity: UIStepper!
    
    
    @IBOutlet weak var txtDescription: UITextField!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    
    // 0 = veg    ,  1 = nonveg
    var FoodType = 0
    
    // 0 = active    , 1 = deactive
    var statusType = 0
    
    var mainUtil = MainUtil()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if isEdit{
            txtDishTitle.text = txtTitle_
            txtPricePerDish.text = txtPrice_
            if txtType_ == "Veg"{
                mainUtil.RadioFillBorder(btn: rdbVegetarian)
            }
            else
            {
                mainUtil.RadioFillBorder(btn: rdbNonvegetarian)
            }
            mainUtil.RadioFillBorder(btn: rdbActive)
            txtCusine.text = txtCusine_
            txtQuantityPerDay.text = txtQty_
            btnSubmit.titleLabel?.text = "Update"
            txtDescription.text = txtDescription_
            
            let url = URL(string: imgURL)!

                // Fetch Image Data
                if let data = try? Data(contentsOf: url) {
                    // Create Image and Update Image View
                    imgFood.image = UIImage(data: data)
                }
            
        }
        else
        {
            //        imgFood.layer.borderWidth = 2
            //        imgFood.layer.cornerRadius = 10
                    mainUtil.RadioFillBorder(btn: rdbVegetarian)
                    mainUtil.RadioFillBorder(btn: rdbActive)
        }
        


    }
    
    
    @IBAction func foodType(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            FoodType = 0
            mainUtil.RadioFillBorder(btn: rdbVegetarian)
            mainUtil.RadioRemoveBorder(btn: rdbNonvegetarian)
        case 1:
            FoodType = 1
            mainUtil.RadioFillBorder(btn: rdbNonvegetarian)
            mainUtil.RadioRemoveBorder(btn: rdbVegetarian)
        default:
            print("Default food type")
        }
    }
    
    
    @IBAction func statusChanged(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            statusType = 0
            mainUtil.RadioFillBorder(btn: rdbActive)
            mainUtil.RadioRemoveBorder(btn: rdbDeactive)
        case 1:
            statusType = 1
            mainUtil.RadioFillBorder(btn: rdbDeactive)
            mainUtil.RadioRemoveBorder(btn: rdbActive)
        default:
            print("Default Status type")
        }
        
    }
    
    @IBAction func StepperChanged(_ sender: UIStepper) {
        
        let number = sender.value
        txtQuantityPerDay.text = String(format: "%.0f", number)
        
    }
    
    @IBAction func quantityChanged(_ sender: UITextField) {
        if mainUtil.StringIsNumber(sender.text!){
            if let qty = Int(sender.text!){
                if qty <= 100{
                    stepperQuantity.value = Double(qty)
                }
            }
        }
        else
        {
            txtQuantityPerDay.text = "0"
        }
    }
   
    @IBAction func QuantityValueChanged(_ sender: UITextField) {
        if mainUtil.StringIsNumber(sender.text!){
            if let qty = Int(sender.text!){
                if qty <= 100{
                    stepperQuantity.value = Double(qty)
                }
            }
        }
        else
        {
            txtQuantityPerDay.text = "0"
        }
    }
    
    
    @IBAction func btnGalleryTapped(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[.originalImage] as! UIImage
    
        self.imgFood.image = img
        let imageURL = info[UIImagePickerController.InfoKey.imageURL] as! URL
          // Handle your logic here, e.g. uploading file to Cloud Storage for Firebase
        UploadImage(fileUrl: imageURL)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func dismissPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func submitHandler(_ sender: UIButton) {
        if(isEdit){
            editDish()
        }else{
            addDish()
        }
    }
    func validateFields() -> String?{
        // Check that all fields are filled in
        if txtDishTitle.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtPricePerDish.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtCusine.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtQuantityPerDay.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtDescription.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            
            return "Please fill in all fields."
        }
        return nil
    }
    func UploadImage(fileUrl: URL)
    {
        do{
            let fileExtension = fileUrl.pathExtension
            let storageref = Storage.storage().reference()
            let imagenode = storageref.child("\(UUID().uuidString).\(fileExtension)")

            imagenode.putFile(from: fileUrl, metadata: nil){(storageMetaData, error) in
                
                if let error = error {
                        print("Upload error: \(error.localizedDescription)")
                        return
                }
                // Show UIAlertController here
                                                                                                
                imagenode.downloadURL { (url, error) in
                        if let error = error  {
                          print("Error on getting download url: \(error.localizedDescription)")
                          return
                        }
                    self.imgURL = url!.absoluteString
                      }
            }
        }
    
    }
    func addDish(){
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showAlert(error!,"Error!")
        }else{
            let title = txtDishTitle.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let price = txtPricePerDish.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let cuisineType = txtCusine.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let qty = txtQuantityPerDay.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let description = txtDescription.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
           
                
                // Get a reference to the database
                let db = Firestore.firestore()
                // Add a document to a collection
                db.collection("Dish").addDocument(data: [
                    "dishTitle":title!,
                    "price":Double(price!) as Any,
                    "typeOfDish":cuisineType!,
                    "maxLimit":Int(qty!) as Any,
                    "pending_limit":Int(qty!) as Any,
                    "isActive": statusType == 1 ? false : true,
                    "isVegetarian": FoodType == 1 ? false : true,
                    "description":description!,
                    "categoryId": Int.random(in: 0...5),
                    "dishImageLink":imgURL
                ]) { error in
                    
                    // Check for errors
                    if error == nil {
                        // No errors
                        
                        // Call get data to retrieve latest data
                        self.showAlert("Dish Added Successfully","Hurrya!")
                        self.resetForm()
                    }
                    else {
                        // Handle the error
                        self.resetForm()
                    }
                }
                
            
            
            
            
        }
        
    }
    func showAlert(_ message:String,_ title:String){
        let uialert = UIAlertController(title: title, message:message, preferredStyle: UIAlertController.Style.alert)
              uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(uialert, animated: true, completion: nil)
    }
    
    func editDish(){
        print("edit dish")
            
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showAlert(error!,"Error!")
        }else{
            let title = txtDishTitle.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let price = txtPricePerDish.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let cuisineType = txtCusine.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let qty = txtQuantityPerDay.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let description = txtDescription.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            
        
        print(Int(price!) as Any)
            fb._updateExistingFieldInDocumentWithId(_collection: "Dish", _docId: dish_!.id, _data: [
                "dishTitle":title!,
                "price":Double(price!) as Any,
                "typeOfDish":cuisineType!,
                "maxLimit":Int(qty!) as Any,
                "pending_limit":Int(qty!) as Any,
                "isActive": statusType == 1 ? false : true,
                "isVegetarian": FoodType == 1 ? false : true,
                "description":description!,
//                    "categoryId": Int.random(in: 0...5),
                "dishImageLink":imgURL])
            self.showAlert("Dish Updated Successfully","Hurrya!")
        
        }
        
    }
    
    func resetForm(){
        txtDishTitle.text = ""
        txtPricePerDish.text = ""
        txtCusine.text = ""
        txtDescription.text = ""
        txtQuantityPerDay.text = "1"
        imgFood.image = UIImage(named: "fastfood")
        mainUtil.RadioFillBorder(btn: rdbActive)
        mainUtil.RadioRemoveBorder(btn: rdbDeactive)
        mainUtil.RadioFillBorder(btn: rdbVegetarian)
        mainUtil.RadioRemoveBorder(btn: rdbNonvegetarian)
    }
    // add permission to info file
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}







// help from https://www.youtube.com/watch?v=mx7oL5CP5AQ
