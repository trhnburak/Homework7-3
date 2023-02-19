//
//  HomeViewController.swift
//  Homework7-3
//
//  Created by Burak Turhan on 15.02.2023.
//

import UIKit

class Add: UIViewController {

    @IBOutlet weak var tastTextField: UITextField!

    var todoItem: TodoItem!

    var addPresenterObject:ViewToPresenterAddProtocol?

    var isAddedToTable: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        addPresenterObject?.createTable()
        AddRouter.createModule(ref: self)
    }
    
    @IBAction func saveButtonTabbed(_ sender: Any) {
        let id: Int = 0
        let task = tastTextField.text ?? ""
        
       let itemValues = Item(id: id, task: task)

        addPresenterObject?.create(itemValues)
        print(isAddedToTable)

        if isAddedToTable == true{
            let seconds = 0.2
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                _ = self.navigationController?.popViewController(animated: true)

            }
        }else{
            print("Error item added to table")
        }
    }
}

extension Add : PresenterToViewAddProtocol {
    func sendDataToView(isAddedToTable: Bool) {
        
        self.isAddedToTable = isAddedToTable
    }
}
