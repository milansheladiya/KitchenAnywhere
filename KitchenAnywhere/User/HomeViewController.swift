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
    
    var categories:[DishCategory] = [
        .init(categoryId: 1, categoryTitle: "Indian Cuisine", categoryImage: "https://picsum.photos/100/200"),
        .init(categoryId: 2, categoryTitle: "Italian Cuisine", categoryImage: "https://picsum.photos/100/200"),
        .init(categoryId: 3, categoryTitle: "Mexican Cuisine", categoryImage: "https://picsum.photos/100/200"),
        .init(categoryId: 4, categoryTitle: "Fast Food", categoryImage: "https://picsum.photos/100/200"),
        .init(categoryId: 5, categoryTitle: "Snacks", categoryImage: "https://picsum.photos/100/200")
    ]
    
    var popularDishes:[Dish] = [
        .init(id: "5FurE5Cjac1zqnyEVD4x", categoryId: 3, chef_id: "eJqjiK3GUdfwrEMSnLJx0zggKto2", dishTitle: "Burger", description: "Really Awesome", dishImageLink: "https://firebasestorage.googleapis.com:443/v0/b/kitchenanywhere-84ad5.appspot.com/o/CDB64B87-8646-479C-B27C-CF2C80B17D26.jpeg?alt=media&token=fa847a61-6a18-4de8-b308-412d21394e0f", isActive: true, isVegetarian: true, maxLimit: 20, pending_limit: 20, price: 10, typeOfDish: "Fast food"),
//        .init(id:2, title: "Garri",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/classic-lasange-4a66137.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        .init(id:3, title: "Vegetarian chilli",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/veggie-chilli-4a57c04.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        .init(id:4, title: "Huevos Rancheros",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-huevos-rancheros-38e94de.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        .init(id:5, title: "Chocolate Motlen Cake",description:"Bake an impressive dinner party dessert with minimum fuss – these chocolate puddings, also known as chocolate fondant or lava cake, have a lovely gooey centre",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-chocolate-molten-cakes-37a25eb.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        .init(id:6, title: "Mince pies",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-901483_10-af0bd6b.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false)

    ]

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
                         print("\(document.documentID) => \(document.data())")
                         
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
                         
                         
                  
                         dishList.CFDishListCollection.append(Dish(id: DishFirebaseId, categoryId: categoryId, chef_id: chef_id, dishTitle: dishTitle, description: description, dishImageLink: dishImageLink, isActive: isActive, isVegetarian: isVegetarian, maxLimit: maxLimit, pending_limit: pending_limit, price: price, typeOfDish: typeOfDish))
                         
                         
                         
                         countId=countId+1
 //                        let isChef:Bool = document.data().get("isChef") as! Bool
                     }
                     
                     self.popularDishes.removeAll()
                     self.popularDishes = dishList.CFDishListCollection
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
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        
        filteredArr = popularDishes.filter
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

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,DishCollectionViewCellDelegate
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularDishesCollectionView:
            if(searchController.isActive){
                return filteredArr.count
            }
            return popularDishes.count
        case chefSpecialCollectionView:
            return popularDishes.count
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
                cell.setUp(dish: popularDishes[indexPath.row])
            }
            cell.delegate = self
            return cell
        case chefSpecialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialCollectionViewCell.identifier, for: indexPath) as! ChefSpecialCollectionViewCell
            cell.setUp(dish: popularDishes[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }

        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if collectionView == categoryCollectionView {
            
        } else
        {
            let controller = DetailDishViewController.instantiate()
            
            controller.dish = collectionView == popularDishesCollectionView ? popularDishes[indexPath.row] : popularDishes[indexPath.row] 
            
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    func toggleFavoriteDish(dishId: String) {
//        let index = dishId-1
//        popularDishes[index].isFavorite = !popularDishes[dishId-1].isFavorite
    }
    
    
    
}
