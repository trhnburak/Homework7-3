//
//  SQLiteCommands.swift
//  Homework7-3
//
//  Created by Burak Turhan on 15.02.2023.
//

import Foundation
import SQLite
import SQLite3


class SQLiteCommands{
    static var table = Table("todo")

    //Expression
    static let id = Expression<Int>("id")
    static let task = Expression<String>("task")

    //Create Table
    static func createTable(){
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return
        }

        do{
            try database.run(table.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(task)
            })
        }catch{
            print("Table already exists: \(error)")
        }
    }

    //Insert Row
    static func insertRow(_ itemValues: Item) -> Bool?{
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }

        do{
            try database.run(table.insert(task <- itemValues.task))
            return true
        }catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT{
            print("Insert row failed: \(message), in \(String(describing: statement))")
            return false
        }catch let error{
            print("Insertion failed: \(error)")
            return false
        }
    }

    //Update Row
    static func updateRow(_ itemValues: Item) -> Bool? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }

        let item = table.filter(id == itemValues.id).limit(1)

        do{
            if ((try database.run(item.update(task <- itemValues.task))) != 0){
                print("Updated item")
                return true
            }else{
                print("Could not update item: item not found")
                return false
            }
        }catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT{
            print("Update row failed \(message), in \(String(describing: statement))")
            return false
        }catch let error{
            print("Update failed: \(error)")
            return false
        }
    }

    //Present Row
    static func presentRows() -> [Item]?{
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }

        var itemArray = [Item]()

        table = table.order(id.desc)

        do{
            for item in try database.prepare(table){
                let idValue = item[id]
                let taskValue = item[task]

                let itemObject = Item(id: idValue, task: taskValue)

                itemArray.append(itemObject)

                print("id \(item[id]), task \(item[task])")
            }

        }catch{
            print("Present row error: \(error)")
        }
        return itemArray
    }

    //Delete Row
    static func deleteRow(itemId: Int){
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        do{
            let item = table.filter(id == itemId).limit(1)
            try database.run(item.delete())
        }catch{
            print("Delete row error: \(error)")
        }
    }

    //Search
    static func search(searchTask: String) -> [Item]?{
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }

        var itemArray = [Item]()

        table = table.order(id.desc)
        
        let searchExpression = Expression<String>("task")

        let condition = table.filter(searchExpression.like("%\(searchTask)%"))

        do{
            for item in try database.prepare(condition){
                let idValue = item[id]
                let taskValue = item[task]

                let itemObject = Item(id: idValue, task: taskValue)

                itemArray.append(itemObject)

                print("id \(item[id]), task \(item[task])")
            }

        }catch{
            print("Search error: \(error)")
        }
        return itemArray
    }
}




