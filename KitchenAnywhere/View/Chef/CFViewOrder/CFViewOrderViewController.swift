//
//  CFViewOrderViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-21.
//

import UIKit

class CFViewOrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblViewOrderList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CFViewOrderTableView1Cell", bundle: nil)
        tblViewOrderList.register(nib, forCellReuseIdentifier: "CFViewOrderTableView1Cell")
        tblViewOrderList.delegate = self
        tblViewOrderList.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you have selected one cell : \(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CFViewOrderCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewOrderList.dequeueReusableCell(withIdentifier: "CFViewOrderTableView1Cell",for: indexPath) as! CFViewOrderTableView1Cell
        cell.setup(with: CFViewOrderCollection[indexPath.row])
        return cell
    }

//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let separator = UIView(frame: CGRec(0, 0, cell.bounds.size.width, 1))
//        separator.backgroundColor = UIColor.white
//        cell.contentView.addSubview(separator)
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
     
    @IBAction func dismissPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
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
