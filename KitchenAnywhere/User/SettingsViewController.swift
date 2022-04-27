//
//  SettingsViewController.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-26.
//

import UIKit

class SettingsViewController: UIViewController,UITableViewDelegate {
    var settingCollection = SettingCollection();
    
    @IBOutlet weak var settingListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingListTableView.dataSource = self
        settingListTableView.delegate = self
        
        // Do any additional setup after loading the view.
        settingListTableView.register(UINib(nibName: SettingTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SettingTableViewCell.identifier)

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        switch settingCollection.settings[indexPath.row].title
        {
        case "Orders":
            navigateToOrders()
        case "Favorite":
            navigateToFavorite()
        case "Logout":
            Logout()
        default:
            print("no option")
        }
        
    }
    
    func navigateToOrders() {
        performSegue(withIdentifier: "goToOrders", sender: self)
    }
    
    func navigateToFavorite() {
        performSegue(withIdentifier: "goToFavorite", sender: self)
    }
    
    func Logout(){
        
//        performSegue(withIdentifier: "goToFavorite", sender: self)
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
extension SettingsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingCollection.settings.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        cell.setup(with: settingCollection.settings[indexPath.row])
        return cell
    }
    
    
}
