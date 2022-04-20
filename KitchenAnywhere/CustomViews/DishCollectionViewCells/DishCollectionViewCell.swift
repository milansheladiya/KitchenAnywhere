//
//  DishCollectionViewCell.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-14.
//

import UIKit

class DishCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: DishCollectionViewCell .self )

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var incrementBtn: UIButton!
    @IBOutlet weak var decrementBtn: UIButton!
    func setUp(dish: Dish){
        titleLable.text = dish.title
        dishImageView.kf.setImage(with: dish.image?.asUrl )
        typeLabel.text = dish.type
        descriptionLabel.text = dish.description
        dishImageView.kf.setImage(with: dish.image?.asUrl )
        dishImageView.layer.cornerRadius = 10
    }
}
