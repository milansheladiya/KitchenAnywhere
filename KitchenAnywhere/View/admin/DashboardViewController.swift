//
//  DashboardViewController.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-20.
//

import UIKit

class DashboardViewController: UIViewController,UITableViewDataSource {
    let fb = FirebaseUtil()
    @IBOutlet weak var listView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listView.register(UINib(nibName: DasboardTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DasboardTableViewCell.identifier)
        listView.dataSource = self
        listView.allowsSelection = false
        loadUserData()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserList.UserListCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DasboardTableViewCell.identifier, for: indexPath) as! DasboardTableViewCell
        cell.setUp(user: UserList.UserListCollection[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func loadUserData(){
        UserList.UserListCollection.removeAll()
        fb._readAllDocuments(_collection: "User"){
            QueryDocumentSnapshot in
            for document in QueryDocumentSnapshot.documents{
                let isChef = document.data()["isChef"] as! Bool
                if(isChef){
                    let user = User(
                        userId: document.data()["userID"] as! String,
                        fullName: document.data()["fullName"] as! String,
                        email: document.data()["email"] as! String,
                        address: document.data()["address"] as? String,
                        phoneNo: document.data()["phoneNo"] as! String,
                        postal_code: document.data()["postal_code"] as! String,
                        isChef: document.data()["isChef"] as! Bool,
                        isAdmin: false,
                        profileImage: UserList.profileImages[Int.random(in: 0...4)],
                        userStatus: document.data()["userStatus"] as! String)
                    UserList.UserListCollection.append(user)
                }
            }
            self.listView.reloadData()
        }
    }
}
extension DashboardViewController: DasboardTableViewCellDelegate{
    func profileApproveRejectHandler(userId: String,btnTag:Int) {
        switch btnTag{
            case 1:
                updateUseStatus(userId:userId,userStatus:"approved")
                break
            case 2:
                updateUseStatus(userId:userId,userStatus:"rejected")
                break
            default:
                print("Error", btnTag)
        }
    }
    func updateUseStatus(userId:String,userStatus:String){
        fb._updateExistingFieldInDocumentWithId(_collection: "User", _docId: userId, _data: [
                "userStatus":userStatus
            ]
        )
        let userIndex = UserList.UserListCollection.firstIndex(where: { $0.userId == userId })
        UserList.UserListCollection[userIndex!].userStatus = userStatus
        listView.reloadData()
    }
}
