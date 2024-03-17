//
//  ExpensePresenter.swift
//  Maexpense
//
//  Created by Ilyas Bintang Prayogi on 17/03/24.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class ExpensePresenter {
    
    // MARK: - Private properties -

    private unowned let view: ExpenseViewInterface
    private let interactor: ExpenseInteractorInterface
    private let wireframe: ExpenseWireframeInterface

    // MARK: - Lifecycle -

    init(view: ExpenseViewInterface, interactor: ExpenseInteractorInterface, wireframe: ExpenseWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ExpensePresenter: ExpensePresenterInterface {
}
