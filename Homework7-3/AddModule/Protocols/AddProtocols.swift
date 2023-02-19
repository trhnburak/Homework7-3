//
//  HomeProtocola.swift
//  Homework7-3
//
//  Created by Burak Turhan on 15.02.2023.
//

import Foundation

protocol ViewToPresenterAddProtocol {
    var addInteractor:PresenterToInteractorAddProtocol? {get set}
    var addView:PresenterToViewAddProtocol? {get set}

    func createTable()
    func create(_ itemValues:Item)
}

protocol PresenterToInteractorAddProtocol{
    var addPresenter:InteractorToPresenterAddProtocol? {get set}

    func createTable()
    func create(_ itemValues:Item)
}

protocol InteractorToPresenterAddProtocol {
    func sendDataToPresenter(isAddedToTable: Bool)
}

protocol PresenterToViewAddProtocol {
    func sendDataToView(isAddedToTable: Bool)
}

protocol PresenterToRouterAddProtocol  {
    static func createModule(ref:Add)
}
