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

        var index = 0
        for (var dish) in HomeViewController.popularDishes {
                    if (dishId == dish.id)
                    {
                        dish.isFavorite = !dish.isFavorite
                        
                        print(HomeViewController.popularDishes)
                        if (dish.isFavorite)
                        {
                            FavouriteDishList.CFDishListCollection.append(dish)
                        }
                        else
                        {
                            var i = 0
                            for (var DeleteDish) in FavouriteDishList.CFDishListCollection
                            {
                                if( dish.id == DeleteDish.id)
                                {
//                                    i = i+1
                                    break
                                }
                                i = i+1
                            }
                            FavouriteDishList.CFDishListCollection.remove(at: i)
                        }
                        
                        break
                        
                    }
            index = index + 1
                }
        
        HomeViewController.popularDishes[index].isFavorite = !HomeViewController.popularDishes[index].isFavorite

    }
    

}
