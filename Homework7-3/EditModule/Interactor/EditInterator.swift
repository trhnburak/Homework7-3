//
//  EditInterator.swift
//  Homework7-3
//
//  Created by Burak Turhan on 17.02.2023.
//

import Foundation

class EditInteractor : PresenterToInteractorEditProtocol {
    var editPresenter: InteractorToPresenterEditProtocol?

    func update(id: Int, task: String){
        let isUpdated = SQLiteCommands.updateRow(Item(id: id, task: task))

        editPresenter?.sendDataToPresenter(isUpdated: isUpdated  ?? false)
    }
}
