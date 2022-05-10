//
//  CategoryCollectionViewCell.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-14.
//

import UIKit
import Kingfisher
protocol CategoryCollectionViewCellDelegate:AnyObject {
    func categoryViewHandller(idx: Int)
}

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: CategoryCollectionViewCell.self )
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    func setUp(category: DishCategory){
        categoryLabel.text = category.categoryTitle
        categoryImageView.kf.setImage(with: category.categoryImage.asUrl )
    }
    
}
