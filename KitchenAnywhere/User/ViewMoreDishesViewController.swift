//
//  ViewMoreDishesViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-27.
//

import UIKit

class ViewMoreDishesViewController: UIViewController, UICollectionViewDelegate,ViewMoreDishesCellDelegate, UICollectionViewDataSource {
    
    
    var AllDishes:[Dish] = [
        .init(id: "5FurE5Cjac1zqnyEVD4x", categoryId: 3, chef_id: "eJqjiK3GUdfwrEMSnLJx0zggKto2", dishTitle: "Burger", description: "Really Awesome", dishImageLink: "https://firebasestorage.googleapis.com:443/v0/b/kitchenanywhere-84ad5.appspot.com/o/CDB64B87-8646-479C-B27C-CF2C80B17D26.jpeg?alt=media&token=fa847a61-6a18-4de8-b308-412d21394e0f", isActive: true, isVegetarian: true, maxLimit: 20, pending_limit: 20, price: 10, typeOfDish: "Fast food"),
//        .init(id:2, title: "Garri",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/classic-lasange-4a66137.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        .init(id:3, title: "Vegetarian chilli",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/veggie-chilli-4a57c04.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        .init(id:4, title: "Huevos Rancheros",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-huevos-rancheros-38e94de.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        .init(id:5, title: "Chocolate Motlen Cake",description:"Bake an impressive dinner party dessert with minimum fuss – these chocolate puddings, also known as chocolate fondant or lava cake, have a lovely gooey centre",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/easy-chocolate-molten-cakes-37a25eb.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false),
//        .init(id:6, title: "Mince pies",description:"This is the best I have ever tasted",image:"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-901483_10-af0bd6b.jpg?quality=90&webp=true&resize=440,400",type:"Veg",price: 2.3,qty: 0,isFavorite:false)

    ]
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

