//
//  OrderListTableViewCell.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-23.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {
    static let identifier = String(describing: OrderListTableViewCell  .self )
    let util = MainUtil()
    
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishTitleLabel: UILabel!
    @IBOutlet weak var qauntityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imgFoodType: UIImageView!
    @IBOutlet weak var pickupStatusLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setup(with order: Dish) {
        dishTitleLabel.text = order.dishTitle
//        orderNumberLabel.text = "#Order-"+order.orderId
        qauntityLabel.text = String(order.qty)
        priceLabel.text = "$ " + String ( order.price )
//        pickupStatusLabel.text = order.pickupStatus
//        pickupStatusLabel.textColor = order.pickupStatus == "Pending" ? MainUtil.getUIColor(hex:"#FFD93D") :
//        MainUtil.getUIColor(hex:"#6BCB77")
        dishImage.kf.setImage(with: order.dishImageLink?.asUrl )
        dishImage.layer.cornerRadius = 10
        imgFoodType.image = order.isVegetarian == true ? #imageLiteral(resourceName: "veg") :  #imageLiteral(resourceName: "non-veg")
    }
}
