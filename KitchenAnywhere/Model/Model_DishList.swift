//
//  Model_DishList.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-19.
//

import Foundation

class dishList
{
static var CFDishListCollection:[Dish] = [
    Dish(id: "5FurE5Cjac1zqnyEVD4x", categoryId: 3, chef_id: "eJqjiK3GUdfwrEMSnLJx0zggKto2", dishTitle: "Burger", description: "Really Awesome", dishImageLink: "https://firebasestorage.googleapis.com:443/v0/b/kitchenanywhere-84ad5.appspot.com/o/CDB64B87-8646-479C-B27C-CF2C80B17D26.jpeg?alt=media&token=fa847a61-6a18-4de8-b308-412d21394e0f", isActive: true, isVegetarian: true, maxLimit: 20, pending_limit: 20, price: 10, typeOfDish: "Fast food", qty: 0,isFavorite: false)
]
}



class FavouriteDishList
{
static var CFDishListCollection:[Dish] = [
    Dish(id: "5FurE5Cjac1zqnyEVD4x", categoryId: 3, chef_id: "eJqjiK3GUdfwrEMSnLJx0zggKto2", dishTitle: "Burger", description: "Really Awesome", dishImageLink: "https://firebasestorage.googleapis.com:443/v0/b/kitchenanywhere-84ad5.appspot.com/o/CDB64B87-8646-479C-B27C-CF2C80B17D26.jpeg?alt=media&token=fa847a61-6a18-4de8-b308-412d21394e0f", isActive: true, isVegetarian: true, maxLimit: 20, pending_limit: 20, price: 10, typeOfDish: "Fast food",qty: 0,isFavorite: true)
]
}
