//
//  CFDishListViewController.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-19.
//

import UIKit

class CFDishListViewController: UIViewController {

    let dish = CFDishListCollection
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        
    }
    
    
    @IBAction func GoBack(_ sender: UIButton) {
        print("Back")
        self.dismiss(animated: true, completion: nil)
        
//        self.performSegue(withIdentifier: "goToLogin", sender: self)
//
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CFDishListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CFDishListCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CFDIshListCollectionViewCell", for: indexPath) as! CFDIshListCollectionViewCell
        cell.setup(with: CFDishListCollection[indexPath.row])
        return cell
    }
}

extension CFDishListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}

extension CFDishListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(CFDishListCollection[indexPath.row].title)
    }
}
