//
//  CartViewController.swift
//  KitchenAnywhere
//
//  Created by Namra Patel on 2022-04-21.
//

import UIKit


class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var cart=dishList.CFDishListCollection
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        cell.setUp(dish: cart[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    @IBAction func GoToCheckOut(_ sender: UIButton) {
//
        self.performSegue(withIdentifier: "goToCheckOut", sender: self)
//
//        let controller = PaymentViewController.instantiate()
        
        
//        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @IBOutlet weak var listView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            listView.register(UINib(nibName: CartTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CartTableViewCell.identifier)
            listView.dataSource = self
        
        
    }
}
    
extension CartViewController: CartTableViewCellDelegate{
    func incrementDecrementHandler(dishId: Int, btnTag: Int) {
        
            print(String(dishId) + " " + String(btnTag))
    }
    
        func ItemDeleteHandler(dishId: Int,btnTag:Int) {
            print(String(dishId) + " " + String(btnTag))
        }
        
    }
    

