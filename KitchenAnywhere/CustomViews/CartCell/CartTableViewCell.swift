//
//  CartTableViewCell.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-21.
//
import UIKit

protocol CartTableViewCellDelegate:AnyObject {
    func ItemDeleteHandler (dishId: String,btnTag:Int)
    func incrementDecrementHandler(dishId: Int,btnTag:Int)
}

class CartTableViewCell: UITableViewCell {

    
    var dishId:String = "0"
    var btnTag:Int = 0
    
    
    weak var delegate: CartTableViewCellDelegate?
    
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var incrementBtn: UIButton!
    @IBOutlet weak var decrementBtn: UIButton!
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var dishTypeLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var dishPrice: UILabel!
    static let identifier = String(describing: CartTableViewCell.self )
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(dish: Dish){
        self.dishId = dish.id
        dishNameLabel.text = dish.dishTitle
        dishTypeLabel.text = dish.isVegetarian == true ? "Veg" : "NonVeg"
        qty.text = String(dish.qty)
        dishPrice.text = "$ " + String(dish.price)
        
//        userNameLabel.text =  user.name
//        userTypeLabel.text = user.isChef ? "Chef" : "Foodie"
        dishImage.kf.setImage(with: dish.dishImageLink?.asUrl )
             // Initialization code
        delete.tintColor = hexStringToUIColor(hex:"#D82148")
    }
    
    
    @IBAction func ItemDeleteHandler(_ sender: UIButton) {
        btnTag = sender.tag
        delegate? .ItemDeleteHandler(dishId: dishId,btnTag:btnTag)
        cartList.cart = cartList.cart.filter { $0.id != self.dishId }
        
    }
    
    @IBAction func incrementDecrementHandler(_ sender: UIButton) {
        btnTag = sender.tag
        delegate? .ItemDeleteHandler(dishId: dishId,btnTag:btnTag)
        
        if(btnTag==1)
        {
            
            var idx:Int = 0 - 1
            for dish_ in cartList.cart{
                print("--------------------- inn===========")
                idx = idx + 1
                if dish_.id == self.dishId
                {
                    var q1 = cartList.cart[idx].qty + 1
                    qty.text = String(q1)
                    print("--------------------- match===========")
                    cartList.cart[idx].qty = q1
                }
            }
        }
        else
        {
            
                
                var idx:Int = 0 - 1
                for dish_ in cartList.cart{
                    print("--------------------- inn===========")
                    idx = idx + 1
                    if dish_.id == self.dishId
                    {
                        print("--------------------- match===========")
                        if cartList.cart[idx].qty > 1 {
                            var q1 = cartList.cart[idx].qty
                            qty.text = String(q1-1)
                            cartList.cart[idx].qty = q1
                        }
                        
                        
                    }
                
            }
            
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
