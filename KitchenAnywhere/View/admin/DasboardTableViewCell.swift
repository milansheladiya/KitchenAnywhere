//
//  DasboardTableViewCell.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-20.
//

import UIKit
protocol DasboardTableViewCellDelegate:AnyObject {
    func profileApproveRejectHandler (userId: String,btnTag:Int)
}
class DasboardTableViewCell: UITableViewCell {
    weak var delegate: DasboardTableViewCellDelegate?
    @IBOutlet weak var approveBtn: UIButton!
    @IBOutlet weak var rejectBtn: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userTypeLabel: UILabel!
    @IBOutlet weak var userProgfileImage: UIImageView!
    @IBOutlet weak var userStatusLabel: UILabel!
    
    static let identifier = String(describing: DasboardTableViewCell  .self )
    var userId:String = ""
    var btnTag:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        approveBtn.tintColor = hexStringToUIColor(hex:"#6BCB77")        // Initialization code
        rejectBtn.tintColor = hexStringToUIColor(hex:"#D82148")
    }
    
    @IBAction func profileApproveRejectHandler(_ sender: UIButton) {
        btnTag = sender.tag
        delegate? .profileApproveRejectHandler(userId: userId,btnTag:btnTag)
    }
    func setUp(user: User){
        //checkmark.circle.fill
        self.userId = user.userId
        if(user.userStatus == "pending"){
            userStatusLabel.isHidden = true
            approveBtn.isHidden = false
            rejectBtn.isHidden = false
        }else{
            approveBtn.isHidden = true
            rejectBtn.isHidden = true
            userStatusLabel.isHidden = false
            userStatusLabel.text = user.userStatus.uppercased()
            userStatusLabel.textColor = user.userStatus == "approved" ? hexStringToUIColor(hex:"#6BCB77") : hexStringToUIColor(hex:"#D82148")
        }
        userNameLabel.text = user.fullName
        userTypeLabel.text = user.isChef ? "Chef" : "Foodie"
        userProgfileImage.kf.setImage(with: user.profileImage.asUrl )
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
