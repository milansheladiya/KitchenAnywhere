//
//  FavouriteCollectionViewCell.swift
//  KitchenAnywhere
//
//  Created by Namra on 2022-04-23.
//

import UIKit

protocol FavouriteCollectionViewCellDelegate:AnyObject {
    func toggleFavoriteDish(dishId: String)
}

class FavouriteCollectionViewCell: UICollectionViewCell {
    weak var delegate: FavouriteCollectionViewCellDelegate?
    static let identifier = String(describing: FavouriteCollectionViewCell .self )
    var dishId:String = "0"
    var isFavotite:Bool = false
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var favouriteBtn: UIButton!
    
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnLess: UIButton!
    
    @IBAction func incrementBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func decrementBtn(_ sender: UIButton) {
    }
    
    func setUp(dish: Dish){
        
//        btnPlus.isHidden = true
//        btnLess.isHidden = true
//        quantityLabel.isHidden = true
        
        self.dishId = dish.id
        self.isFavotite = true
        titleLable.text = dish.dishTitle
        dishImageView.kf.setImage(with: dish.dishImageLink?.asUrl )
        typeLabel.text = dish.isVegetarian == true ? "Veg" : "NonVeg"
//        descriptionLabel.text = dish.description
        dishImageView.kf.setImage(with: dish.dishImageLink?.asUrl )
        dishImageView.layer.cornerRadius = 10
        quantityLabel.text = String(dish.qty)
        if(isFavotite){
            favouriteBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            favouriteBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        favouriteBtn.tintColor = hexStringToUIColor(hex:"#EA2E30")
    }
    @IBAction func toggleFavoriteDish(_ sender: UIButton) {
        
        if(isFavotite){
            favouriteBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }else{
            favouriteBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        isFavotite = !isFavotite
        delegate?.toggleFavoriteDish(dishId:dishId)
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

