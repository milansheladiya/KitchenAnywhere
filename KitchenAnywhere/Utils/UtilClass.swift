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
    
    
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isValidNumber(_ phone: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: phone)
        return result
    }
    
    
    static func _Alert(_ uiView: UIViewController,_ title:String,_ msg:String)
    {
        let uialert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        uiView.present(uialert, animated: true, completion: nil)
    }
    
    static func _AlertWithDismiss(_ uiView: UIViewController,_ title:String,_ msg:String)
    {
        let uialert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        uiView.present(uialert, animated: true, completion: {
            uiView.dismiss(animated: true, completion: nil)
        })
    }
    
    
    static func getTextfield(view: UIView) -> [UITextField] {
        var results = [UITextField]()
        for subview in view.subviews as [UIView] {
            if let textField = subview as? UITextField {
                results += [textField]
            } else {
                results += getTextfield(view: subview)
            }
        }
        return results
    }
    
}
