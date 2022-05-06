//
//  CartViewController.swift
//  KitchenAnywhere
//
//  Created by Namra Patel on 2022-04-21.
//

import UIKit


class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var cart=[
        Dish(id: "5FurE5Cjac1zqnyEVD4x", categoryId: 3, chef_id: "eJqjiK3GUdfwrEMSnLJx0zggKto2", dishTitle: "Burger", description: "Really Awesome", dishImageLink: "https://firebasestorage.googleapis.com:443/v0/b/kitchenanywhere-84ad5.appspot.com/o/CDB64B87-8646-479C-B27C-CF2C80B17D26.jpeg?alt=media&token=fa847a61-6a18-4de8-b308-412d21394e0f", isActive: true, isVegetarian: true, maxLimit: 20, pending_limit: 20, price: 10, typeOfDish: "Fast food"),
//        Dish(id:2, title: "Garri",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/classic-lasange-4a66137.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        Dish(id:3, title: "Vegetarian chilli",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/veggie-chilli-4a57c04.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        Dish(id:4, title: "Huevos Rancheros",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-huevos-rancheros-38e94de.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        Dish(id:5, title: "Chocolate Motlen Cake",description:"Bake an impressive dinner party dessert with minimum fuss – these chocolate puddings, also known as chocolate fondant or lava cake, have a lovely gooey centre",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-chocolate-molten-cakes-37a25eb.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        Dish(id:6, title: "Mince pies",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-901483_10-af0bd6b.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false)
    ]
    
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
    
        func ItemDeleteHandler(dishId: String,btnTag:Int) {
            print(String(dishId) + " " + String(btnTag))
        }
        
    }
    

