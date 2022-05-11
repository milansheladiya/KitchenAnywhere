//
//  Model_Order.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-23.
//

import Foundation

class OrderList
{
    static var OrderCollection:[Order] = []
}

struct Order{
    let orderId: String
    let chefId: String
    let userId: String
    let dishList: [Dish]
    
    let nameOfFoodie: String
    let contactOfFoodie: String
    
    let orderStatus: String
    let orderDate: Date
}

