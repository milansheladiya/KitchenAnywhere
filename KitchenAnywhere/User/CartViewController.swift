//
//  CartViewController.swift
//  KitchenAnywhere
//
//  Created by Namra Patel on 2022-04-21.
//
import UIKit


class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    
    
    var cart=cartList.cart
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        cell.setUp(dish: cart[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func GoToCheckOut(_ sender: UIButton) {

        self.performSegue(withIdentifier: "goToCheckOut", sender: self)
 
    }
    
    @IBOutlet weak var listView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            listView.register(UINib(nibName: CartTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CartTableViewCell.identifier)
            listView.dataSource = self
        
        
        lblSubTotal.text = "$0"
        lblTax.text = "$0"
        lblTotal.text = "$0"
        
        BillCalculation()
        listView.reloadData()        
       
    }
    
    

    
    func BillCalculation(){
            var subTotal:Double = 0.0
            for dish in cartList.cart {
                subTotal = subTotal + (dish.price * Double(dish.qty))
            }
            lblSubTotal.text = "$ \(String(subTotal))"
            lblTax.text = "$ \(String(format: "%.2f",(subTotal * 0.15)))"
            lblTotal.text = "$ \(String(format: "%.2f",(subTotal + (subTotal * 0.15))))"
            
        }
    
}
    
extension CartViewController: CartTableViewCellDelegate{
    func incrementDecrementHandler(dishId: Int, btnTag: Int) {
        
            print(String(dishId) + " = " + String(btnTag))
        BillCalculation()
        listView.reloadData()
    }
    
        func ItemDeleteHandler(dishId: String,btnTag:Int) {
            print(String(dishId) + " " + String(btnTag))
            BillCalculation()
            listView.reloadData()
        }
        
    }
    
