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
    
    static func getUIColor(hex: String, alpha: Double = 1.0) -> UIColor? {
        var cleanString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cleanString.hasPrefix("#")) {
            cleanString.remove(at: cleanString.startIndex)
        }

        if ((cleanString.count) != 6) {
            return nil
        }

        var rgbValue: UInt32 = 0
        Scanner(string: cleanString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
