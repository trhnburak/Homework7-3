//
//  HomePresenter.swift
//  Homework7-3
//
//  Created by Burak Turhan on 16.02.2023.
//

import Foundation

class HomePresenter : ViewToPresenterHomeProtocol {
    var homeInteractor: PresenterToInteractorHomeProtocol?
    var homeView: PresenterToViewHomeProtocol?

    func connectToDatabase() {
        homeInteractor?.connectToDatabase()
    }

    func loadTodo() {
        homeInteractor?.loadTodo()
    }

    func search(searchString: String) {
        homeInteractor?.search(searchString: searchString)
    }

    func delete(id: Int) {
        homeInteractor?.delete(id: id)
    }
}

extension HomePresenter : InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(itemArray: [Item]) {
        homeView?.sendDataToView(itemArray: itemArray)
    }
}
