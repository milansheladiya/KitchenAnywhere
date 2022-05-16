//
//  PaymentViewController.swift
//  KitchenAnywhere
//
//  Created by Namra on 2022-04-22.
//

import UIKit
import Firebase
import FirebaseFirestore

class PaymentViewController: UIViewController {

    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblAddress.text =  UserList.GlobleUser.address
        
        lblSubTotal.text = "0"
        lblTax.text = "0"
        lblTotal.text = "0"
        
        BillCalculation()
    }
    
    func BillCalculation(){
            var subTotal:Double = 0.0
            for dish in cartList.cart {
                subTotal = subTotal + (dish.price * Double(dish.qty))
            }
            lblSubTotal.text = "$ \(String(subTotal))"
            lblTax.text = "$ \(String(subTotal * 0.15))"
            lblTotal.text = "$ \(String(subTotal + (subTotal * 0.15)))"
            
        }
    
    
    @IBAction func goBack(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    func showAlert(_ message:String,_ title:String){
        let uialert = UIAlertController(title: title, message:message, preferredStyle: UIAlertController.Style.alert)
              uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(uialert, animated: true, completion: {
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    
    
    @IBAction func paymentBtn(_ sender: UIButton) {
        
        let date = Date()
        let calendar = Calendar.current
        
        var allDish:[Any] = []
        
        var index = 0
      
    
        
        for (cart) in cartList.cart
        {
            var tempDish = [
                "id":cart.id,
                "categoryId":cart.categoryId,
                "chef_id":cart.chef_id,
                "dishTitle":cart.dishTitle,
                "price": cart.price,
                "typeOfDish": cart.typeOfDish,
                "maxLimit": cart.maxLimit,
                "pending_limit": cart.pending_limit,
                "isActive": cart.isActive,
                "isVegetarian": cart.isVegetarian,
                "description": cart.description,
                "qty": cart.qty,
                "isFavourite":cart.isActive,
                "dishImageLink": cart.dishImageLink
            ] as [String : Any]
         
            allDish.append(tempDish)
            
            index=index+1
        }
        var orderid: String = FirebaseUtil.auth.currentUser!.uid + String(Int.random(in: 0...100000000))
        let order = ["orderId": orderid, "chefId": cartList.cart.first?.chef_id ?? "", "userId": FirebaseUtil.auth.currentUser!.uid, "dishList": allDish , "nameOfFoodie": UserList.GlobleUser.fullName ?? "User", "contactOfFoodie": UserList.GlobleUser.phoneNo ?? "438-456-4897", "orderStatus": "pending", "orderDate": date
        ] as [String : Any]
        

        print(order)
   
        
        let _db = Firestore.firestore()
        // Add a document to a collection
        _db.collection("Order").addDocument(data: order) { error in
            

            if error == nil {
                cartList.cart = []
                self.showAlert("Ordered Successfully","Hurrya!")

            }
            else {
                // Handle the error
                
            }
        }
    }
    


}
