//
//  EditRouter.swift
//  Homework7-3
//
//  Created by Burak Turhan on 17.02.2023.
//

import Foundation

class EditRouter : PresenterToRouterEditProtocol{
    static func createModule(ref: Edit) {
        let presenter = EditPresenter()

        //View
        ref.editPresenterObject = presenter

        //Presenter
        ref.editPresenterObject?.editInteractor = EditInteractor()
        ref.editPresenterObject?.editView = ref

        //Interactor
        ref.editPresenterObject?.editInteractor?.editPresenter = presenter
    }
}
