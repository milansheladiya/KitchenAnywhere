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
    @IBAction func AddToCart(_ sender: UIButton) {
    }
    
    
    var dish : Dish!
    
    
  override func viewDidLoad()
    {
        super.viewDidLoad()
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
        
        cartList.cart.append(dish)
        let uialert = UIAlertController(title: "Cart", message: "Added to Cart!", preferredStyle: UIAlertController.Style.alert)
              uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(uialert, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
