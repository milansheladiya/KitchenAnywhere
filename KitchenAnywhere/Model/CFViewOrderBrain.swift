//
//  CFViewOrderBrain.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-23.
//

import Foundation

var CFViewOrderCollection = [
    Order(orderId:"QhExHmV4q2wB6uY95evQ",
          chefId:"XrsN00COWQhAdn91rc9CsS4Eb3g1",
          userId:"bFot9ojnTBZVdSlQSS405IDKxbV2",
          dishList: [
            Dish(id: "5FurE5Cjac1zqnyEVD4x", categoryId: 2, chef_id: "eJqjiK3GUdfwrEMSnLJx0zggKto2", dishTitle: "Burger", description: "Really Awesome", dishImageLink: "https://firebasestorage.googleapis.com:443/v0/b/kitchenanywhere-84ad5.appspot.com/o/CDB64B87-8646-479C-B27C-CF2C80B17D26.jpeg?alt=media&token=fa847a61-6a18-4de8-b308-412d21394e0f", isActive: true, isVegetarian: true, maxLimit: 10, pending_limit: 10, price: 12, typeOfDish: "fast food", qty: 5, isFavorite: false),
             Dish(id: "5FurE5Cjac1zqnyEVD4x", categoryId: 2, chef_id: "eJqjiK3GUdfwrEMSnLJx0zggKto2", dishTitle: "Burger", description: "Really Awesome", dishImageLink: "https://firebasestorage.googleapis.com:443/v0/b/kitchenanywhere-84ad5.appspot.com/o/CDB64B87-8646-479C-B27C-CF2C80B17D26.jpeg?alt=media&token=fa847a61-6a18-4de8-b308-412d21394e0f", isActive: true, isVegetarian: true, maxLimit: 10, pending_limit: 10, price: 12, typeOfDish: "fast food", qty: 5, isFavorite: false)
                    ],
          nameOfFoodie:"N Patel",
          contactOfFoodie:"514-554-8765",
          orderStatus:"Pending",
          orderDate:Date()
         ),
    
    
    Order(orderId:"QhExHmV4q2wB6uY95evQ",
          chefId:"XrsN00COWQhAdn91rc9CsS4Eb3g1",
          userId:"bFot9ojnTBZVdSlQSS405IDKxbV2",
          dishList: [Dish(id: "5FurE5Cjac1zqnyEVD4x", categoryId: 2, chef_id: "eJqjiK3GUdfwrEMSnLJx0zggKto2", dishTitle: "Mango Ras - Puri", description: "Really Awesome", dishImageLink: "https://firebasestorage.googleapis.com/v0/b/kitchenanywhere-84ad5.appspot.com/o/EsYLnyMWzZfaAaVTNN2ckl9DHRn26?alt=media&token=171b9a2d-dd02-44f2-885d-e0b7ae5453df", isActive: true, isVegetarian: true, maxLimit: 10, pending_limit: 10, price: 12, typeOfDish: "fast food", qty: 5, isFavorite: false)],
          nameOfFoodie:"N Patel",
          contactOfFoodie:"514-554-8765",
          orderStatus:"Picked-up",
          orderDate:Date()
         ),
    
//    Order(orderId: "Acbxyz", userId: "YhDCKJkNH4vktJHz4T46",nameOfFoodie: "Milan",contactOfFoodie: "514-234-9876", dishId: "YhDCKJkNH4vktJHz4T46", title: "Manchurian", description: "It is Chinese Dish which made from spices sauce with balls of corn floor and vegetables.", image: "https://firebasestorage.googleapis.com/v0/b/kitchenanywhere-84ad5.appspot.com/o/EsYLnyMWzZfaAaVTNN2ckl9DHRn2?alt=media&token=c199341c-b4a5-4cd7-bb13-ae15fa41926c", type: "Veg", price: 20, orderQuantity: 5, pickupStatus: "Pending"),
//    Order(orderId: "QEWFGH", userId: "ypdXyIWKLjcOszkKlG5l",nameOfFoodie: "Namra",contactOfFoodie: "514-987-1234", dishId: "Ua52KJkYIC3JfSgGZ3YF", title: "Mango Ras - Puri", description: "It is indian popular dish. It made from mango and wheat flour.", image: "https://firebasestorage.googleapis.com/v0/b/kitchenanywhere-84ad5.appspot.com/o/EsYLnyMWzZfaAaVTNN2ckl9DHRn2?alt=media&token=e3063fb9-e988-4f76-b5d9-52928a997d2b", type: "Veg", price: 35, orderQuantity: 2, pickupStatus: "Pending"),
//    Order(orderId: "BFDSDD", userId: "sBnwQnfgjkYGKACFUql8FXoZ57g2",nameOfFoodie: "Dushant",contactOfFoodie: "514-999-6666", dishId: "wefFgzU5Xj7ViwjCnV4T", title: "punjabi", description: "This is best indian cuisine", image: "https://firebasestorage.googleapis.com/v0/b/kitchenanywhere-84ad5.appspot.com/o/EsYLnyMWzZfaAaVTNN2ckl9DHRn26?alt=media&token=171b9a2d-dd02-44f2-885d-e0b7ae5453df", type: "Veg", price: 10, orderQuantity: 7, pickupStatus: "Done"),
]

