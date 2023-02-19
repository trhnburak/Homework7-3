//
//  HomeProtocols.swift
//  Homework7-3
//
//  Created by Burak Turhan on 16.02.2023.
//

import Foundation

protocol ViewToPresenterHomeProtocol {
    var homeInteractor:PresenterToInteractorHomeProtocol? {get set}
    var homeView:PresenterToViewHomeProtocol? {get set}

    func connectToDatabase()
    func loadTodo()
    func search(searchString:String)
    func delete(id:Int)
}

protocol PresenterToInteractorHomeProtocol {
    var homePresenter:InteractorToPresenterHomeProtocol? {get set}

    func connectToDatabase()
    func loadTodo()
    func search(searchString:String)
    func delete(id:Int)
}

protocol InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(itemArray:[Item])
}

protocol PresenterToViewHomeProtocol {
    func sendDataToView(itemArray:[Item])
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref:Home)
}
