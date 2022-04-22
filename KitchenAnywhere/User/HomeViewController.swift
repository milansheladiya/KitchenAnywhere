//
//  HomeViewController.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-14.
//

import UIKit

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
        .init(id:1, title: "Crock Pot Roast",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0),
        .init(id:2, title: "Garri",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/classic-lasange-4a66137.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0),
        .init(id:3, title: "Vegetarian chilli",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/veggie-chilli-4a57c04.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0),
        .init(id:4, title: "Huevos Rancheros",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-huevos-rancheros-38e94de.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0),
        .init(id:5, title: "Chocolate Motlen Cake",description:"Bake an impressive dinner party dessert with minimum fuss – these chocolate puddings, also known as chocolate fondant or lava cake, have a lovely gooey centre",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-chocolate-molten-cakes-37a25eb.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0),
        .init(id:6, title: "Mince pies",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-901483_10-af0bd6b.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0)

    ]

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    @IBOutlet weak var chefSpecialCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularDishesCollectionView.delegate = self
        popularDishesCollectionView.dataSource = self
        chefSpecialCollectionView.delegate = self
        chefSpecialCollectionView.dataSource = self
        registerCells()
        
        //Search Controller
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        searchController.searchBar.delegate = self

    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        
        filteredArr = popularDishes.filter
        {
            dish in
            print("inside filter",searchText,dish)
            if(searchText != ""){
                let searchTextMatched =  dish.title.lowercased().contains(searchText.lowercased())
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
   
}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource
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
}
