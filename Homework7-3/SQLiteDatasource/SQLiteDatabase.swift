//
//  SQLiteDatabase.swift
//  Homework7-3
//
//  Created by Burak Turhan on 15.02.2023.
//

import Foundation
import SQLite

class SQLiteDatabase {
    static let sharedInstance = SQLiteDatabase()
    var database: Connection?

    private init() {
        do{
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

            let fileUrl = documentDirectory
                .appending(path: "todoList")
                .appendingPathExtension("sqlite3")

            database = try Connection(fileUrl.path())

        }catch{
                print("Create connection to database error: \(error)")
        }
    }

    func createTable(){
        SQLiteCommands.createTable()
    }
}
