//
//  HomeViewController.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-14.
//

import UIKit
import Firebase
import FirebaseFirestore

class HomeViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
        
    let searchController =  UISearchController()
    var filteredArr = [Dish]()
    var idxSelected = 0;
    var categories:[DishCategory] = [
        .init(categoryId: 1, categoryTitle: "Indian Cuisine", categoryImage: "https://picsum.photos/100/200"),
        .init(categoryId: 2, categoryTitle: "Italian Cuisine", categoryImage: "https://picsum.photos/100/200"),
        .init(categoryId: 3, categoryTitle: "Mexican Cuisine", categoryImage: "https://picsum.photos/100/200"),
        .init(categoryId: 4, categoryTitle: "Fast Food", categoryImage: "https://picsum.photos/100/200"),
        .init(categoryId: 5, categoryTitle: "Snacks", categoryImage: "https://picsum.photos/100/200")
    ]
    
    static var popularDishes = dishList.CFDishListCollection
    
    let badgeSize: CGFloat = 20
    let badgeTag = 9830384
    
    @IBOutlet weak var btnCart: UIBarButtonItem!
    @IBOutlet weak var btnBarCart: UIBarButtonItem!
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    @IBOutlet weak var chefSpecialCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
         let db = Firestore.firestore()
         var response:String = ""
         
         db.collection("Dish").getDocuments() { (querySnapshot, err) in
                 if let err = err {
                     print("Error getting documents: \(err)")
                 } else {
                     var countId = 0
                     dishList.CFDishListCollection.removeAll()
                     for document in querySnapshot!.documents {
                         
                         guard let validTeam = document.data() as? Dictionary<String, Any> else {continue}
                         
                         
                         
                         let DishFirebaseId = document.documentID
                         
                         let id = countId
                         let dishTitle = validTeam["dishTitle"] as? String ?? ""
                         let description = validTeam["description"] as? String ?? ""
                         let dishImageLink = validTeam["dishImageLink"] as? String ?? ""
                         let typeOfDish = validTeam["typeOfDish"] as? String ?? ""
                         let categoryId = validTeam["categoryId"] as? Int ?? 2
                         let chef_id = validTeam["chef_id"] as? String ?? ""
                         let isActive = validTeam["isActive"] as? Bool ?? true
                         let isVegetarian = validTeam["isVegetarian"] as? Bool ?? true
                         let maxLimit = validTeam["maxLimit"] as? Int ?? 10
                         let pending_limit = validTeam["pending_limit"] as? Int ?? 10
                         let price = validTeam["price"] as? Double ?? 10.0
                         let qty = 0
                         
                         
                  
                         dishList.CFDishListCollection.append(Dish(id: DishFirebaseId, categoryId: categoryId, chef_id: chef_id, dishTitle: dishTitle, description: description, dishImageLink: dishImageLink, isActive: isActive, isVegetarian: isVegetarian, maxLimit: maxLimit, pending_limit: pending_limit, price: price, typeOfDish: typeOfDish , qty: qty,isFavorite: false))
                         
                         
                         
                         countId=countId+1
 //                        let isChef:Bool = document.data().get("isChef") as! Bool
                     }
                     
                     HomeViewController.popularDishes.removeAll()
                     HomeViewController.popularDishes = dishList.CFDishListCollection
                     FavouriteDishList.CFDishListCollection = dishList.CFDishListCollection
                     self.popularDishesCollectionView.reloadData()
                     self.chefSpecialCollectionView.reloadData()
                     
                 }
         }
         
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularDishesCollectionView.delegate = self
        popularDishesCollectionView.dataSource = self
        chefSpecialCollectionView.delegate = self
        chefSpecialCollectionView.dataSource = self
        registerCells()
        
        //Search Controller
        self.navigationItem.setHidesBackButton(true, animated: true)

        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController

        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToViewMore"{
            
            let nav = segue.destination as! UINavigationController
            let destinationVC = nav.topViewController as! ViewMoreDishesViewController
//            let destinationVC = segue.destination as! ViewMoreDishesViewController
            
            var filteredDishArr = HomeViewController.popularDishes.filter
            {
                dish in
                let matchedDish =  dish.categoryId == categories[idxSelected].categoryId
                    return matchedDish
                return true
            }
            destinationVC.AllDishes = filteredDishArr
        }
        
    }

    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        
        filteredArr = HomeViewController.popularDishes.filter
        {
            dish in
            if(searchText != ""){
                let searchTextMatched =  dish.dishTitle.lowercased().contains(searchText.lowercased())
                return searchTextMatched
            }
            return true
        }
        popularDishesCollectionView.reloadData()
    }

    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularDishesCollectionView.register(UINib(nibName: DishCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishCollectionViewCell.identifier)
        chefSpecialCollectionView.register(UINib(nibName: ChefSpecialCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefSpecialCollectionViewCell.identifier)

    }
   
    @IBAction func cartBuuton(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goToCart", sender: self)
    }
    
    @IBAction func viewMorePressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToViewMore", sender: self)
        
    }
    
}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,DishCollectionViewCellDelegate,CategoryCollectionViewCellDelegate
{
    func categoryViewHandller(idx: Int) {
        idxSelected = idx
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularDishesCollectionView:
            if(searchController.isActive){
                return filteredArr.count
            }
            return HomeViewController.popularDishes.count
        case chefSpecialCollectionView:
            return HomeViewController.popularDishes.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setUp(category: categories[indexPath.row])
            return cell
        case popularDishesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishCollectionViewCell.identifier, for: indexPath) as! DishCollectionViewCell
            if(searchController.isActive){
                cell.setUp(dish: filteredArr[indexPath.row])
            }else{
                cell.setUp(dish: HomeViewController.popularDishes[indexPath.row])
            }
            cell.delegate = self
            return cell
        case chefSpecialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialCollectionViewCell.identifier, for: indexPath) as! ChefSpecialCollectionViewCell
            cell.setUp(dish: HomeViewController.popularDishes[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }

        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if collectionView == categoryCollectionView {
            categoryViewHandller(idx: indexPath.row)
            self.performSegue(withIdentifier: "goToViewMore", sender: self)
        } else
        {
            let controller = DetailDishViewController.instantiate()
            
            controller.dish = collectionView == popularDishesCollectionView ? HomeViewController.popularDishes[indexPath.row] : HomeViewController.popularDishes[indexPath.row]
            
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func toggleFavoriteDish(dishId: String) {
        
        print(dishId)
        
//        let index = dishId-1
//        popularDishes[index].isFavorite = !popularDishes[dishId-1].isFavorite
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
    
    func incrementBtn(dishId: String , qty: Int)
    {
        print("=======================-------===================================")
        var index = 0
        for (var dish) in HomeViewController.popularDishes {
                    if (dishId == dish.id)
                    {
                        break
                    }
            index = index + 1
                }
        
        HomeViewController.popularDishes[index].qty = qty
        dishList.CFDishListCollection = HomeViewController.popularDishes
    }
    
    func decrementBtn(dishId: String , qty: Int)
    {
        var index = 0
        for (var dish) in HomeViewController.popularDishes {
                    if (dishId == dish.id)
                    {
                        break
                    }
            index = index + 1
                }
        
        HomeViewController.popularDishes[index].qty = qty
        dishList.CFDishListCollection = HomeViewController.popularDishes
    }
    
}
