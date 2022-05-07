//
//  CFDishListViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-19.
//

import UIKit

class CFDishListViewController: UIViewController {

    let dish = dishList.CFDishListCollection
    let fb = FirebaseUtil()
    
    var idxSelected = 0;
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        LoadDishes()
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
            print("Prepare \(idxSelected)")
            
            let destinationVC = segue.destination as! CFAddDishViewController
            destinationVC.isEdit = true
            destinationVC.txtTitle_ = dish[idxSelected].dishTitle
            destinationVC.txtPrice_ = String(dish[idxSelected].price)
            destinationVC.txtType_ = dish[idxSelected].isVegetarian == true ? "Veg" : "NonVeg"
            destinationVC.txtCusine_ = "Asian"
            destinationVC.txtStatus_ = "Active"
            destinationVC.txtQty_ = String(dish[idxSelected].maxLimit)
            destinationVC.txtDescription_ = dish[idxSelected].description
            destinationVC.imgURL = dish[idxSelected].dishImageLink!

            
        }
        
    }
    
    
    func LoadDishes(){
        
        dishList.CFDishListCollection.removeAll()
        
        fb._readAllDocuments(_collection: "Dish") { QueryDocumentSnapshot in
            for document in QueryDocumentSnapshot.documents {
                
                let dish_ = Dish(
                    id: document.documentID,
                    categoryId: document.data()["categoryId"] as! Int,
                    chef_id: document.data()["chef_id"] as! String,
                    dishTitle: document.data()["dishTitle"] as! String,
                    description: document.data()["description"] as! String,
                    dishImageLink:document.data()["dishImageLink"] as? String,
                    isActive: document.data()["isActive"] as! Bool,
                    isVegetarian: document.data()["isVegetarian"] as! Bool,
                    maxLimit: document.data()["maxLimit"] as! Int,
                    pending_limit: document.data()["pending_limit"] as! Int,
                    price: document.data()["price"] as! Double,
                    typeOfDish: document.data()["typeOfDish"] as! String)
                dishList.CFDishListCollection.append(dish_)
                
                
                        print("\(document.documentID) => \(document.data())")
                    }
            self.collectionView.reloadData()
        }
        
    }


}

extension CFDishListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishList.CFDishListCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CFDIshListCollectionViewCell", for: indexPath) as! CFDIshListCollectionViewCell
        cell.setup(with: dishList.CFDishListCollection[indexPath.row])
        
        cell.editButton.tag = indexPath.row
        print(cell.editButton.tag)
        cell.editButton.addTarget(self, action: #selector(editDishes), for: .touchUpInside)
        return cell
    }
    
    
    @objc func editDishes(sender: UIButton){
        
        idxSelected = sender.tag
        print("AA : \(idxSelected)")
        self.performSegue(withIdentifier: "goToAddDishes", sender: self)
        
    }
    
}

extension CFDishListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}

