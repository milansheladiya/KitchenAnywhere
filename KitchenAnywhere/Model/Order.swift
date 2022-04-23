//
//  Model_Order.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-23.
//

import Foundation

struct Order{
    let orderId: String
    let userId: String
    let nameOfFoodie: String
    let contactOfFoodie: String
    let dishId: String
    let title: String
    let description: String
    let image: String?
    let type: String
    let price: Double
    let orderQuantity:Int
    let pickupStatus: String
}

