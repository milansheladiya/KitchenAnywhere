//
//  OrderListViewController.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-23.
//

import UIKit

class OrderListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var orderTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        orderTableView.allowsSelection = false
        orderTableView.register(UINib(nibName: OrderListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OrderListTableViewCell.identifier)
        orderTableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CFViewOrderCollection[section].dishList.count
    }
    
    func numberOfSections(in: UITableView) -> Int{
        print("total section : \(CFViewOrderCollection.count)")
        return CFViewOrderCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTableViewCell.identifier, for: indexPath) as! OrderListTableViewCell
        cell.setup(with: CFViewOrderCollection[indexPath.section].dishList[indexPath.row])
        
        cell.orderNumberLabel.text = "#Order-"+CFViewOrderCollection[indexPath.section].orderId
        cell.pickupStatusLabel.text = CFViewOrderCollection[indexPath.section].orderStatus
        cell.pickupStatusLabel.textColor = CFViewOrderCollection[indexPath.section].orderStatus == "Pending" ? MainUtil.getUIColor(hex:"#FFD93D") : MainUtil.getUIColor(hex:"#6BCB77")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return "Order id: #"+CFViewOrderCollection[section].orderId
       }


}
