//
//  Edit.swift
//  Homework7-3
//
//  Created by Burak Turhan on 17.02.2023.
//

import UIKit

class Edit: UIViewController {
    @IBOutlet weak var editTextField: UITextField!

    var item:Item?

    var editPresenterObject:ViewToPresenterEditProtocol?

    var isUpdated: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        EditRouter.createModule(ref: self)
        
        if let i = item {
            editTextField.text = i.task
        }
    }

    @IBAction func updateButtonTapped(_ sender: Any) {
        if let it = editTextField.text, let i = item {
          editPresenterObject?.update(id: i.id, task: it)


            if isUpdated == true{
                let seconds = 0.2
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    _ = self.navigationController?.popViewController(animated: true)

                }
            }else{
                print("Error item update in table")
            }
        }
    }
}

extension Edit : PresenterToViewEditProtocol {
    func sendDataToView(isUpdated: Bool) {
        self.isUpdated = isUpdated
    }
}
