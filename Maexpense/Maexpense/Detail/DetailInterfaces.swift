//
//  DetailInterfaces.swift
//  Maexpense
//
//  Created by Ilyas Bintang Prayogi on 18/03/24.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol DetailWireframeInterface: WireframeInterface {
}

protocol DetailViewInterface: ViewInterface {
    func displayMonthData(data: MonthPortoDatum)
}

protocol DetailPresenterInterface: PresenterInterface {
    func presentDetailPortofolio()
}

protocol DetailInteractorInterface: InteractorInterface {
}