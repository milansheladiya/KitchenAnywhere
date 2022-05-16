//
//  CFViewOrderViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-21.
//

import UIKit
import Firebase

class CFViewOrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblViewOrderList: UITableView!
    let fb = FirebaseUtil()
    var order_ = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CFViewOrderTableView1Cell", bundle: nil)
        tblViewOrderList.register(nib, forCellReuseIdentifier: "CFViewOrderTableView1Cell")
        tblViewOrderList.delegate = self
        tblViewOrderList.dataSource = self
        
        //reload data
        CFViewOrderCollection.removeAll()
        LoadDishes()
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("you have selected one cell : \(indexPath)")
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return CFViewOrderCollection[section].dishList.count
        }
        
        func numberOfSections(in: UITableView) -> Int{
            print("total section : \(CFViewOrderCollection.count)")
            return CFViewOrderCollection.count
        }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewOrderList.dequeueReusableCell(withIdentifier: "CFViewOrderTableView1Cell",for: indexPath) as! CFViewOrderTableView1Cell
        cell.setup(with: CFViewOrderCollection[indexPath.section].dishList[indexPath.row])
        cell.lblFoodie.text = CFViewOrderCollection[indexPath.section].nameOfFoodie
        cell.lblFoodieContact.text = CFViewOrderCollection[indexPath.section].contactOfFoodie
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return "Order id: #"+CFViewOrderCollection[section].orderId
       }
       
//   func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?{
//
//       return CFViewOrderCollection[section].nameOfFoodie + "  -  " + CFViewOrderCollection[section].contactOfFoodie
//
//   }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
     
    @IBAction func dismissPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func LoadDishes(){
        
        dishList.CFDishListCollection.removeAll()
        
        fb._readAllDocumentsWithField(_collection: "Order",_field: "chefId", _value: Auth.auth().currentUser!.uid) { QueryDocumentSnapshot in
            for document in QueryDocumentSnapshot.documents {
                
                var dishes_ = [Dish]()
                
                for subDoc in document.data()["dishList"] as! [Any?]{
                    let dish_ = subDoc as? [String: Any]
                    dishes_.append(Dish(id: dish_!["id"] as! String,
                                       categoryId: dish_!["categoryId"] as! Int,
                                       chef_id: dish_!["chef_id"] as! String,
                                       dishTitle: dish_!["dishTitle"] as! String,
                                       description: dish_!["description"] as! String,
                                        dishImageLink: dish_!["dishImageLink"] as? String,
                                       isActive: dish_!["isActive"] as! Bool,
                                       isVegetarian: dish_!["isVegetarian"] as! Bool,
                                       maxLimit: dish_!["maxLimit"] as! Int,
                                       pending_limit: dish_!["pending_limit"] as! Int,
                                       price: dish_!["price"] as! Double,
                                       typeOfDish: dish_!["typeOfDish"] as! String,
                                       qty: dish_!["qty"] as! Int,
                                       isFavorite: dish_!["isFavourite"] as! Bool)
                    )
                }
            
                print("--------------------------------------")
                var abc = document.data()["orderDate"] as! Timestamp

                let myDate = NSDate(timeIntervalSince1970: TimeInterval(abc.seconds))
                print("--------------------------------------")
                
                let orders_ = Order(orderId: document.documentID,
                              chefId: document.data()["chefId"] as! String,
                              userId: document.data()["userId"] as! String,
                              dishList: dishes_,
                              nameOfFoodie: document.data()["nameOfFoodie"] as! String,
                              contactOfFoodie: document.data()["contactOfFoodie"] as! String,
                              orderStatus: document.data()["orderStatus"] as! String,
                                    orderDate: myDate as Date
                )

                CFViewOrderCollection.append(orders_)
                
                
                        print("\(document.documentID) => \(document.data())")
                    }
            self.tblViewOrderList.reloadData()
        }
        
        print("4 new loaded data : \(dishList.CFDishListCollection.count)")
        
    }
    
    
    
    
}


