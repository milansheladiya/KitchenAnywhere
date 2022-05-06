//
//  ChefSpecialCollectionViewCell.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-17.
//
 
import UIKit

class ChefSpecialCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: ChefSpecialCollectionViewCell  .self )
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!;
    
    func setUp(dish: Dish){
        titleLabel.text = dish.dishTitle
        dishImageView.kf.setImage(with: dish.dishImageLink?.asUrl )
        typeLabel.text = dish.isVegetarian == true ? "Veg" : "NonVeg"
        descriptionLabel.text = dish.description
        dishImageView.kf.setImage(with: dish.dishImageLink?.asUrl )
        dishImageView.layer.cornerRadius = 10
    }
   
}
