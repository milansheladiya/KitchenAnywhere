//
//  CFDIshListCollectionViewCell.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-19.
//

import UIKit

class CFDIshListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgFoodType: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    
    
    func setup(with dish: Dish) {
            
        imgFood.kf.setImage(with: dish.dishImageLink?.asUrl)
        lblTitle.text = dish.dishTitle
        
        imgFoodType.image = dish.isVegetarian == true ? #imageLiteral(resourceName: "veg") :  #imageLiteral(resourceName: "non-veg")
        lblPrice.text = "$ " + String ( dish.price )
        
        }
    
    
    
    
}
