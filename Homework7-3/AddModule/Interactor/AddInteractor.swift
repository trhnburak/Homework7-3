//
//  HomeInteractor.swift
//  Homework7-3
//
//  Created by Burak Turhan on 15.02.2023.
//

import Foundation

class AddInteractor : PresenterToInteractorAddProtocol {
    var addPresenter: InteractorToPresenterAddProtocol?

    func createTable(){
        let database = SQLiteDatabase.sharedInstance
        database.createTable()
    }

    func create(_ itemValues:Item) {
        let itemAddedToTable = SQLiteCommands.insertRow(itemValues)

        addPresenter?.sendDataToPresenter(isAddedToTable: itemAddedToTable  ?? false)
    }
}
