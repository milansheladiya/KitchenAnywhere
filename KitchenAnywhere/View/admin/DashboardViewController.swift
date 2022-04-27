//
//  DashboardViewController.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-20.
//

import UIKit

class DashboardViewController: UIViewController,UITableViewDataSource {
    
    let data = [
        User(
            id:1,
            name:"Dishant",
            email: "dishant@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: false,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1537368910025-700350fe46c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"),
        User(
            id:2,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: true,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1569124589354-615739ae007b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"),
        User(
            id:3,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: false,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1586379727013-eb6e9acf6903?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"),
        User(
            id:4,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: false,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1531891437562-4301cf35b7e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8ODl8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"),
        User(
            id:5,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: false,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1520975954732-35dd22299614?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NjN8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"),
        User(
            id:6,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: true,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/flagged/photo-1579657831106-50315fcf3220?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NzN8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"),
        User(
            id:7,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: false,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1569124589354-615739ae007b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"),
        User(
            id:8,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: false,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1520975954732-35dd22299614?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NjN8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"),
        User(
            id:9,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: false,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1477533521073-d060f0ca12fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NDN8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"),
        User(
            id:10,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: true,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1537368910025-700350fe46c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NDJ8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"),
        User(
            id:11,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: false,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1496811278625-55d74ab26979?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MzZ8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"),
        User(
            id:12,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: true,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1550246140-29f40b909e5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MzF8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"),
        User(
            id:13,
            name:"John",
            email: "john@gmail.com",
            address: "Address1",
            phone_no: "1334432",
            postal_code: "H1V1A9",
            isChef: false,
            isAdmin: false,
            profileImage:"https://images.unsplash.com/photo-1523464896048-06ae115fed74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mjh8OTQ1MjQ5NHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60")
    ]
    @IBOutlet weak var listView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listView.register(UINib(nibName: DasboardTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DasboardTableViewCell.identifier)
        listView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DasboardTableViewCell.identifier, for: indexPath) as! DasboardTableViewCell
        cell.setUp(user: data[indexPath.row])
        cell.delegate = self
        return cell
        
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
extension DashboardViewController: DasboardTableViewCellDelegate{
    func profileApproveRejectHandler(userId: Int,btnTag:Int) {
        print(String(userId) + " " + String(btnTag))
    }
}
