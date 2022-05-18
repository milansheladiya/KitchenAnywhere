//
//  ViewMoreDishesViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-27.
//

import UIKit
import Firebase

class ViewMoreDishesViewController: UIViewController, UICollectionViewDelegate,ViewMoreDishesCellDelegate, UICollectionViewDataSource {
    
    let fb = FirebaseUtil()
    var AllDishes = dishList.CFDishListCollection
    
    @IBOutlet weak var ViewMoreCollections: UICollectionView!
    
    var idxToPass = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewMoreCollections.delegate = self
        ViewMoreCollections.dataSource = self
        
        ViewMoreCollections.register(UINib(nibName: ViewMoreDishesCell.identifier, bundle: nil), forCellWithReuseIdentifier: ViewMoreDishesCell.identifier)
        dishList.CFDishListCollection.removeAll()
        LoadDishes()
        
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishList.CFDishListCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewMoreDishesCell.identifier, for: indexPath) as! ViewMoreDishesCell
        cell.setUp(dish: dishList.CFDishListCollection[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked")

        let controller = DetailDishViewController.instantiate()

        controller.dish = collectionView == ViewMoreCollections ? AllDishes[indexPath.row] : AllDishes[indexPath.row]
        
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func toggleFavoriteDish(dishId: String) {
//        let index = dishId-1
//        AllDishes[index].isFavorite = !AllDishes[dishId-1].isFavorite
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "goToFullDetails" {
//
//            let destinationVC = segue.destination as! DetailDishViewController
//            destinationVC.dish = AllDishes[idxToPass]
//
//        }
//
//    }

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
                    price: document.data()["price"] as! Double ?? 0.0,
                    typeOfDish: document.data()["typeOfDish"] as! String,
                    qty: 0,isFavorite: false)
                
                dishList.CFDishListCollection.append(dish_)
                    }
            self.ViewMoreCollections.reloadData()
        }
        
        print(" new loaded data : \(dishList.CFDishListCollection.count)")
        
    }


}

