//
//  FavouriteViewController.swift
//  KitchenAnywhere
//
//  Created by Namra on 2022-04-23.
//

import UIKit

class FavouriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, FavouriteCollectionViewCellDelegate {
    
    
    
    
    
    var favouriteDishes:[Dish] = [
        .init(id:1, title: "Crock Pot Roast",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
        .init(id:2, title: "Garri",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/classic-lasange-4a66137.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
        .init(id:3, title: "Vegetarian chilli",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/veggie-chilli-4a57c04.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
        .init(id:4, title: "Huevos Rancheros",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-huevos-rancheros-38e94de.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
        .init(id:5, title: "Chocolate Motlen Cake",description:"Bake an impressive dinner party dessert with minimum fuss – these chocolate puddings, also known as chocolate fondant or lava cake, have a lovely gooey centre",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-chocolate-molten-cakes-37a25eb.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
        .init(id:6, title: "Mince pies",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-901483_10-af0bd6b.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false)
    ]

    
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
    
    func toggleFavoriteDish(dishId: Int) {
        
            let index = dishId-1
        favouriteDishes[index].isFavorite = !favouriteDishes[dishId-1].isFavorite
    }
    

}
