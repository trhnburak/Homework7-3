//
//  EditProtocols.swift
//  Homework7-3
//
//  Created by Burak Turhan on 17.02.2023.
//

import Foundation

protocol ViewToPresenterEditProtocol {
    var editInteractor:PresenterToInteractorEditProtocol? {get set}
    var editView:PresenterToViewEditProtocol? {get set}

    func update(id:Int,task:String)
}

protocol PresenterToInteractorEditProtocol {
    var editPresenter:InteractorToPresenterEditProtocol? {get set}

    func update(id:Int,task:String)
}

protocol InteractorToPresenterEditProtocol {
    func sendDataToPresenter(isUpdated: Bool)
}

protocol PresenterToViewEditProtocol {
    func sendDataToView(isUpdated: Bool)
}

protocol PresenterToRouterEditProtocol {
    static func createModule(ref:Edit)
}
