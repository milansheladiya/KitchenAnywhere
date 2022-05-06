//
//  ViewMoreDishesViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-27.
//

import UIKit

class ViewMoreDishesViewController: UIViewController, UICollectionViewDelegate,ViewMoreDishesCellDelegate, UICollectionViewDataSource {
    
    
    var AllDishes = dishList.CFDishListCollection
    
    @IBOutlet weak var ViewMoreCollections: UICollectionView!
    
    var idxToPass = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewMoreCollections.delegate = self
        ViewMoreCollections.dataSource = self
        
        ViewMoreCollections.register(UINib(nibName: ViewMoreDishesCell.identifier, bundle: nil), forCellWithReuseIdentifier: ViewMoreDishesCell.identifier)

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AllDishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewMoreDishesCell.identifier, for: indexPath) as! ViewMoreDishesCell
        cell.setUp(dish: AllDishes[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked")

        let controller = DetailDishViewController.instantiate()

        controller.dish = collectionView == ViewMoreCollections ? AllDishes[indexPath.row] : AllDishes[indexPath.row]
        
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func toggleFavoriteDish(dishId: Int) {
        let index = dishId-1
        AllDishes[index].isFavorite = !AllDishes[dishId-1].isFavorite
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

