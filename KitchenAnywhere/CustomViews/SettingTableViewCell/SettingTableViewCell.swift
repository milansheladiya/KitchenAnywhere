//
//  SettingTableViewCell.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-26.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    static let identifier = String(describing: SettingTableViewCell  .self )
    
    @IBOutlet weak var settingtxtLabel: UILabel!
    @IBOutlet weak var settingImgIcon: UIImageView!

    func setup(with setting:Setting){
//        self.selectionStyle = MainUtil.getUIColor(hex: "#2596be", alpha: 0.4)
        settingtxtLabel.text = setting.title
        settingImgIcon.image = setting.icon
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            self.contentView.backgroundColor = MainUtil.getUIColor(hex: "#F0F0F0")
        }else{
            self.contentView.backgroundColor = .white
        }
    }
}
