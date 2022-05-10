//
//  CFDishListViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-19.
//

import UIKit
import Firebase

class CFDishListViewController: UIViewController {

    let dish = dishList.CFDishListCollection
    let fb = FirebaseUtil()
    
    var idxSelected = 0;
    
    @IBAction func start(_ sender: Any){
        
        
        
    }
  
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
            print("3 Prepare \(idxSelected) + \(dishList.CFDishListCollection.count)")
            
            
            let destinationVC = segue.destination as! CFAddDishViewController
            destinationVC.dish_ = dishList.CFDishListCollection[idxSelected]
            destinationVC.isEdit = true
            destinationVC.txtTitle_ = dishList.CFDishListCollection[idxSelected].dishTitle
            destinationVC.txtPrice_ = String(dishList.CFDishListCollection[idxSelected].price)
            destinationVC.txtType_ = dishList.CFDishListCollection[idxSelected].isVegetarian == true ? "Veg" : "NonVeg"
            destinationVC.txtCusine_ = "Asian"
            destinationVC.txtStatus_ = "Active"
            destinationVC.txtQty_ = String(dishList.CFDishListCollection[idxSelected].maxLimit)
            destinationVC.txtDescription_ = dishList.CFDishListCollection[idxSelected].description
            destinationVC.imgURL = dishList.CFDishListCollection[idxSelected].dishImageLink!
            destinationVC.callbackClosure = {[weak self] in
                self!.LoadDishes()
                
            }
            
        }
        
    }
    
    
    func LoadDishes(){
        
        dishList.CFDishListCollection.removeAll()
        
        fb._readAllDocumentsWithField(_collection: "Dish",_field: "chef_id", _value: Auth.auth().currentUser!.uid) { QueryDocumentSnapshot in
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
                    price: document.data()["price"] as! Double ?? 0.0,
                    typeOfDish: document.data()["typeOfDish"] as! String,
                    qty: 0)
                dishList.CFDishListCollection.append(dish_)
                
                
                        print("\(document.documentID) => \(document.data())")
                    }
            self.collectionView.reloadData()
        }
        
        print("4 new loaded data : \(dishList.CFDishListCollection.count)")
        
    }


}

extension CFDishListViewController: CFDIshListCollectionViewCellDelegate{
    func dishEditHandller(idx: Int) {
        print("1 Array Index : \(idx)")
        idxSelected = idx
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
        cell.idx = indexPath.row
        cell.editButton.addTarget(self, action: #selector(editDishes), for: .touchUpInside)
        
        return cell
    }
    
    
    @objc func editDishes(sender: UIButton){
        
        idxSelected = sender.tag
        print("5 AA : \(idxSelected)")
        print("-------------------- start ----------------")
        
//        guard let secondController = self.storyboard?.instantiateViewController(withIdentifier: "addDishCV") as? CFAddDishViewController else { return }
//        secondController.callbackClosure = {[weak self] in
//
//            self!.LoadDishes()
//
//        }
        self.performSegue(withIdentifier: "goToAddDishes", sender: self)
        
    }
    
}

extension CFDishListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}


