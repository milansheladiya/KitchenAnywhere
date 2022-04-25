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
        titleLabel.text = dish.title
        dishImageView.kf.setImage(with: dish.image?.asUrl )
        typeLabel.text = dish.type
        descriptionLabel.text = dish.description
        dishImageView.kf.setImage(with: dish.image?.asUrl )
        dishImageView.layer.cornerRadius = 10
    }
   
}
