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
        return CFViewOrderCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTableViewCell.identifier, for: indexPath) as! OrderListTableViewCell
        cell.setup(with: CFViewOrderCollection[indexPath.row])
//        cell.delegate = self
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
