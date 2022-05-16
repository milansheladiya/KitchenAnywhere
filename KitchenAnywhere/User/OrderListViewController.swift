//
//  OrderListViewController.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-23.
//

import UIKit
import Firebase

class OrderListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var orderTableView: UITableView!
    
    let fb = FirebaseUtil()
    var order_ = [Order]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        orderTableView.allowsSelection = false
        orderTableView.register(UINib(nibName: OrderListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OrderListTableViewCell.identifier)
        orderTableView.dataSource = self
        
    
        LoadDishes()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CFViewOrderCollection[section].dishList.count
    }
    
    func numberOfSections(in: UITableView) -> Int{
        print("total section : \(CFViewOrderCollection.count)")
        return CFViewOrderCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTableViewCell.identifier, for: indexPath) as! OrderListTableViewCell
        cell.setup(with: CFViewOrderCollection[indexPath.section].dishList[indexPath.row])
        
        cell.orderNumberLabel.text = "#Order-"+CFViewOrderCollection[indexPath.section].orderId
        cell.pickupStatusLabel.text = CFViewOrderCollection[indexPath.section].orderStatus
        cell.pickupStatusLabel.textColor = CFViewOrderCollection[indexPath.section].orderStatus == "Pending" ? MainUtil.getUIColor(hex:"#FFD93D") : MainUtil.getUIColor(hex:"#6BCB77")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return "Order id: #"+CFViewOrderCollection[section].orderId
       }

    func LoadDishes(){
        
        CFViewOrderCollection.removeAll()
        
        fb._readAllDocumentsWithField(_collection: "Order",_field: "userId", _value: Auth.auth().currentUser!.uid) { QueryDocumentSnapshot in
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
            self.orderTableView.reloadData()
        }
        
        print("4 new loaded data : \(CFViewOrderCollection.count)")
        
    }
    
    
}
