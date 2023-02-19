//
//  HomePresenter.swift
//  Homework7-3
//
//  Created by Burak Turhan on 15.02.2023.
//

import Foundation

class AddPresenter : ViewToPresenterAddProtocol {
    var addInteractor: PresenterToInteractorAddProtocol?
    var addView: PresenterToViewAddProtocol?

    func createTable() {
        addInteractor?.createTable()
    }
    
    func create(_ itemValues:Item){
        addInteractor?.create(itemValues)
    }
}

extension AddPresenter : InteractorToPresenterAddProtocol {
    func sendDataToPresenter(isAddedToTable: Bool) {
        addView?.sendDataToView(isAddedToTable: isAddedToTable)
    }
}
