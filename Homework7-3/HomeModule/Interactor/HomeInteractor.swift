//
//  HomeInteractor.swift
//  Homework7-3
//
//  Created by Burak Turhan on 16.02.2023.
//

import Foundation

class HomeInteractor : PresenterToInteractorHomeProtocol {
    var homePresenter: InteractorToPresenterHomeProtocol?


    func connectToDatabase(){
        _ = SQLiteDatabase.sharedInstance
    }

    func loadTodo() {

        var itemArray = SQLiteCommands.presentRows()

        homePresenter?.sendDataToPresenter(itemArray: itemArray ?? [])

    }

    func search(searchString: String) {
        var itemArray = SQLiteCommands.search(searchTask: searchString)
        
        homePresenter?.sendDataToPresenter(itemArray: itemArray ?? [])
    }

    func delete(id: Int) {
        SQLiteCommands.deleteRow(itemId: id)
    }
}
