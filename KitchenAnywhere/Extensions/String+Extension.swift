//
//  String+Extension.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-14.
//

import Foundation

extension String{
    var asUrl: URL?{
        return URL(string: self)
    }
}
