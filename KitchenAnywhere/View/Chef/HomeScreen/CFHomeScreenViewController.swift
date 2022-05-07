//
//  CFHomeScreenViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-26.
//

import UIKit
import Firebase

class CFHomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Logied In User : " + Auth.auth().currentUser!.uid)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addDishPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToAddDishes", sender: self)
        
    }
    
    @IBAction func viewDishesPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToDishes", sender: self)
        
    }
    
    
    @IBAction func OrdersPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToOrders", sender: self)
        
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func profilePressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToUserProfile", sender: self)
        
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
