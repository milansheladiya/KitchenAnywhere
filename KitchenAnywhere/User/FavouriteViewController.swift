//
//  FavouriteViewController.swift
//  KitchenAnywhere
//
//  Created by Namra on 2022-04-23.
//

import UIKit

class FavouriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, FavouriteCollectionViewCellDelegate {
    
    
    
    
    
    var favouriteDishes = FavouriteDishList.CFDishListCollection

    
    @IBOutlet weak var favouriteDishesCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        favouriteDishesCollectionView.delegate = self
        favouriteDishesCollectionView.dataSource = self
        
        
        favouriteDishesCollectionView.register(UINib(nibName: FavouriteCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: FavouriteCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favouriteDishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteCollectionViewCell.identifier, for: indexPath) as! FavouriteCollectionViewCell
        
            cell.setUp(dish: favouriteDishes[indexPath.row])
        
        cell.delegate = self
        return cell
        
    }
    
    func toggleFavoriteDish(dishId: String) {

        
//            let index = dishId-1
//        favouriteDishes[index].isFavorite = !favouriteDishes[dishId-1].isFavorite
    }
    

}
