//
//  UiViewController+Extensions.swift
//  KitchenAnywhere
//
//  Created by Namra on 2022-04-17.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
