//
//  UtilClass.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-20.
//

import UIKit

class MainUtil {
    
     func RadioFillBorder(btn: UIButton){
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 2
    }
    
     func RadioRemoveBorder(btn: UIButton){
        btn.layer.cornerRadius = 0
        btn.layer.borderWidth = 0
    }
    
    func StringIsNumber(_ txt:String) -> Bool {
        let digitsCharacters = CharacterSet.decimalDigits
        return CharacterSet(charactersIn: txt).isSubset(of: digitsCharacters)
    }
    
    func StringToInt(_ txt:String) -> Int {
        return Int(txt)!
    }
    
}
