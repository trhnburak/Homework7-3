//
//  HomeRouter.swift
//  Homework7-3
//
//  Created by Burak Turhan on 15.02.2023.
//

import Foundation

class AddRouter : PresenterToRouterAddProtocol {
    static func createModule(ref: Add) {

        let presenter = AddPresenter()

        //View
        ref.addPresenterObject = presenter

        //Presenter
        ref.addPresenterObject?.addInteractor = AddInteractor()
        ref.addPresenterObject?.addView = ref

        //Interactor
        ref.addPresenterObject?.addInteractor?.addPresenter = presenter

    }
}
