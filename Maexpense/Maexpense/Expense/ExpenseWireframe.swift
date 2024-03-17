//
//  ExpenseWireframe.swift
//  Maexpense
//
//  Created by Ilyas Bintang Prayogi on 17/03/24.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ExpenseWireframe: BaseWireframe<ExpenseViewController> {

    // MARK: - Module setup -

    init() {
        let moduleViewController = ExpenseViewController()
        super.init(viewController: moduleViewController)

        let interactor = ExpenseInteractor()
        let presenter = ExpensePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ExpenseWireframe: ExpenseWireframeInterface {
    func goToDetail(data: MonthPortoDatum) {
        navigationController?.pushWireframe(DetailWireframe(monthData: data))
    }
    
}
