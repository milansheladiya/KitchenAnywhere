//
//  Setting.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-26.
//

import Foundation
import UIKit

struct Setting{
    let title:String
    let icon: UIImage
}

struct SettingCollection{
    let settings = [
        Setting(title: "Orders", icon: UIImage(named: "orders")!),
        Setting(title: "Favorite", icon: UIImage(named: "heart")!),
        Setting(title: "Logout", icon: UIImage(named: "logout")!),

    ]
}
