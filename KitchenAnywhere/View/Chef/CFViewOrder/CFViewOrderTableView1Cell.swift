//
//  CFViewOrderTableView1Cell.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-23.
//

import UIKit

class CFViewOrderTableView1Cell: UITableViewCell {

    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblFoodie: UILabel!
    @IBOutlet weak var lblFoodieContact: UILabel!
    @IBOutlet weak var imgFoodType: UIImageView!
    
    let util = MainUtil()
    let cardV = CardView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.backgroundColor = util.getUIColor(hex: "#E9EFC0")
        // Initialization code
    }

//    override func layoutSubviews() {
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 40, left: 10, bottom: 40, right: 10))
//    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with order: Order) {
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.cornerRadius = 10
        self.layer.shadowOpacity = 0.2
        self.layer.cornerRadius = 10
        
        imgFood.kf.setImage(with: order.image?.asUrl)
        lblTitle.text = order.title
        lblQty.text = String(order.orderQuantity)
        lblPrice.text = "$ " + String ( order.price )
        
        lblFoodie.text = order.nameOfFoodie
        lblFoodieContact.text = order.contactOfFoodie
        
        imgFoodType.image = order.type == "Veg" ? #imageLiteral(resourceName: "veg") :  #imageLiteral(resourceName: "non-veg")
        
        
        
    }
    
}
