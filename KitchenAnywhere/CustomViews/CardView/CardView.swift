//
//  CardView.swift
//  KitchenAnywhere
//
//  Created by Dishant Desai on 2022-04-14.
//


import UIKit

class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initalSetup()
    }
    private func initalSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.3
        layer.cornerRadius = 10
    }
}

