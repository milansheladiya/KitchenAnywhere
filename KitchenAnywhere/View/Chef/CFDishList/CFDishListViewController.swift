//
//  CFDishListViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-19.
//

import UIKit

class CFDishListViewController: UIViewController {

    let dish = dishList.CFDishListCollection
    
    var idxSelected = 0;
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    

    
    @IBAction func GoBack(_ sender: UIButton) {
        print("Back")
        self.dismiss(animated: true, completion: nil)
        
//        self.performSegue(withIdentifier: "goToLogin", sender: self)
//
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        self.performSegue(withIdentifier: "goToAddDishes", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToAddDishes"{
            
            print(dish[idxSelected].title)
            
            let destinationVC = segue.destination as! CFAddDishViewController
            destinationVC.isEdit = true
            destinationVC.txtTitle_ = dish[idxSelected].title
            destinationVC.txtPrice_ = String(dish[idxSelected].price)
            destinationVC.txtType_ = dish[idxSelected].type
            destinationVC.txtCusine_ = "Asian"
            destinationVC.txtStatus_ = "Active"
            destinationVC.txtQty_ = String(dish[idxSelected].qty)
            destinationVC.txtDescription_ = dish[idxSelected].description
            destinationVC.imgURL = dish[idxSelected].image!
//            destinationVC.txtDishTitle.text = dish[idxSelected].title
//            destinationVC.txtPricePerDish.text = String(dish[idxSelected].price)
//
//            if(dish[idxSelected].type == "Veg"){
//                destinationVC.rdbVegetarian.sendActions(for: .touchUpInside)
//            }
//            else
//            {
//                destinationVC.rdbNonvegetarian.sendActions(for: .touchUpInside)
//            }
//
//            destinationVC.txtCusine.text = "Asian"
//
//            destinationVC.rdbActive.sendActions(for: .touchUpInside)
//
//            destinationVC.txtQuantityPerDay.text = String(dish[idxSelected].qty)
            
        }
        
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

extension CFDishListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishList.CFDishListCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CFDIshListCollectionViewCell", for: indexPath) as! CFDIshListCollectionViewCell
        cell.setup(with: dishList.CFDishListCollection[indexPath.row])
        
        cell.editButton.tag = indexPath.row
        cell.editButton.addTarget(self, action: #selector(editDishes), for: .touchUpInside)
        return cell
    }
    
    
    @objc func editDishes(sender: UIButton){
        
        idxSelected = sender.tag
        self.performSegue(withIdentifier: "goToAddDishes", sender: self)
        
    }
    
}

extension CFDishListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}

//extension CFDishListViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        print(CFDishListCollection[indexPath.row].title)
//        print("first")
//        print(collectionView)
//
//        idxSelected = indexPath.row
//
//    }
//
//}
