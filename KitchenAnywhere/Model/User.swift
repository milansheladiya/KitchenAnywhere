//
//  User.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-20.
//

import Foundation

struct User {
    let userId: String
    let fullName: String
    let email: String
    let address: String?
    let phoneNo: String
    let postal_code: String
    let isChef: Bool
    let isAdmin: Bool
    let profileImage: String
    var userStatus: String
    
}
class UserList{
    static var UserListCollection:[User] = [
        User(
            userId: "1",
            fullName:"Dishant",
            email: "dishant@gmail.com",
            address: "Address1",
            phoneNo: "1334432",
            postal_code: "H1V1A9",
            isChef: false,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1537368910025-700350fe46c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
            userStatus: "pending"
        )
    ]
    static let profileImages = [
        "https://images.unsplash.com/photo-1523464896048-06ae115fed74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mjh8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1550246140-29f40b909e5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MzF8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1550246140-29f40b909e5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MzF8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1477533521073-d060f0ca12fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NDN8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
        "https://images.unsplash.com/photo-1569124589354-615739ae007b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
    ]
    
    
    static var GlobleUser:User = UserListCollection[0]

}


