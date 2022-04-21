//
//  CFAddDishViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-20.
//

import UIKit
import SwiftUI

class CFAddDishViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

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
    
    // 0 = veg    ,  1 = nonveg
    var FoodType = 0
    
    // 0 = active    , 1 = deactive
    var statusType = 0
    
    var mainUtil = MainUtil()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        imgFood.layer.borderWidth = 2
//        imgFood.layer.cornerRadius = 10
        mainUtil.RadioFillBorder(btn: rdbVegetarian)
        mainUtil.RadioFillBorder(btn: rdbActive)

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
        self.dismiss(animated: true, completion: nil)
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
