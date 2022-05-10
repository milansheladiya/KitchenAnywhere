//
//  Dish.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-14.
//

import Foundation

struct Dish{
    let id: String
    let categoryId:Int
    let chef_id:String
    let dishTitle: String
    let description: String
    let dishImageLink: String?
    var isActive:Bool
    let isVegetarian: Bool
    let maxLimit: Int
    let pending_limit: Int
    let price: Double
    let typeOfDish:String
    var qty: Int
    var isFavorite: Bool
}
