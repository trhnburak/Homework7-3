//
//  HomeRouter.swift
//  Homework7-3
//
//  Created by Burak Turhan on 16.02.2023.
//

import Foundation

class HomeRouter : PresenterToRouterHomeProtocol {
    static func createModule(ref: Home) {
        let presenter = HomePresenter()

        //View
        ref.homePresenterObject = presenter

        //Presenter
        ref.homePresenterObject?.homeInteractor = HomeInteractor()
        ref.homePresenterObject?.homeView = ref

        //Interactor
        ref.homePresenterObject?.homeInteractor?.homePresenter = presenter
    }
}
