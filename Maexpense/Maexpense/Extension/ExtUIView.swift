//
//  ExtUIView.swift
//  Maexpense
//
//  Created by Ilyas Bintang Prayogi on 18/03/24.
//

import UIKit

extension UIView {
    func roundCorner(){
        layer.cornerRadius = 6
        layer.masksToBounds = true
    }
    
    func addShadow(){
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 2
        layer.shadowOffset = .zero
    }
}
