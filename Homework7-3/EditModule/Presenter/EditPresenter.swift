//
//  EditPresenter.swift
//  Homework7-3
//
//  Created by Burak Turhan on 17.02.2023.
//

import Foundation

class EditPresenter : ViewToPresenterEditProtocol  {
    var editInteractor: PresenterToInteractorEditProtocol?
    var editView: PresenterToViewEditProtocol?

    func update(id: Int, task: String){
        editInteractor?.update(id: id, task: task)
    }
}

extension EditPresenter : InteractorToPresenterEditProtocol {
    func sendDataToPresenter(isUpdated: Bool) {
        editView?.sendDataToView(isUpdated: isUpdated)
    }
}
