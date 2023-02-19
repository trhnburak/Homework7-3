//
//  TodoTableViewCell.swift
//  Homework7-3
//
//  Created by Burak Turhan on 16.02.2023.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!

    func setCellWithValuesOf(_ item: Item){
        taskLabel.text = item.task
    }

}
