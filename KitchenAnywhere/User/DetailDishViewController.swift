//
//  DetailDishViewController.swift
//  KitchenAnywhere
//
//  Created by Namra on 2022-04-17.
//

import UIKit

class DetailDishViewController: UIViewController {
    

    @IBOutlet weak var DishPrice: UILabel!
    @IBOutlet weak var DishType: UILabel!
    @IBOutlet weak var DishTitle: UILabel!
    @IBOutlet weak var DishImageView: UIImageView!
    @IBOutlet weak var DishDescription: UILabel!
    @IBOutlet weak var txtQty: UITextField!
    
    
    @IBAction func AddToCart(_ sender: UIButton) {
    }
    
    
    var dish : Dish!
    
    var numbers_:[Int] = []
    var pickerView = UIPickerView()
    
    
  override func viewDidLoad()
    {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        numbers_ = Array(0...dish.pending_limit)
        txtQty.inputView = pickerView
        
        populateView()
    }
    
    

    private func populateView()
    {
        DishImageView.kf.setImage(with: dish?.dishImageLink?.asUrl)
        DishTitle.text = dish.dishTitle
        DishDescription.text = dish.description
        DishType.text = dish.isVegetarian == true ? "Veg" : "NonVeg"
        DishPrice.text = "$ " + String ( dish.price )
    }

    
    @IBAction func addToCart(_ sender: UIButton) {
        if(txtQty.text != "0"){
            dish.qty = Int(txtQty.text!) ?? 1
            cartList.cart.append(dish)
            
            
            let uialert = UIAlertController(title: "Cart", message: "Added to Cart!", preferredStyle: UIAlertController.Style.alert)
                  uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(uialert, animated: true, completion: nil)
        }
        else
        {
            MainUtil._Alert(self, "Warning", "Qty must be more than one!")
        }
        
        
        
    }
    
    
    
}


extension DetailDishViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers_.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numbers_[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtQty.text = String(numbers_[row])
        txtQty.resignFirstResponder()
    }
    
}
