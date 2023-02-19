//
//  TodoItem.swift
//  Homework7-3
//
//  Created by Burak Turhan on 15.02.2023.
//

import Foundation

class TodoItem{

    private var itemValues: Item?

    let id:Int?
    let task:String?

    init(itemValues: Item?) {
        self.itemValues = itemValues

        self.id = itemValues?.id
        self.task = itemValues?.task
    }
}
