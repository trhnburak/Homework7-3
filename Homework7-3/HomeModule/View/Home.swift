//
//  Home.swift
//  Homework7-3
//
//  Created by Burak Turhan on 16.02.2023.
//

import Foundation
import UIKit

class Home: UIViewController {


    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var searchBar: UISearchBar!
    var itemArray = [Item]()

    var homePresenterObject:ViewToPresenterHomeProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self

        tableView.delegate = self
        tableView.dataSource = self

        homePresenterObject?.connectToDatabase()
        HomeRouter.createModule(ref: self)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
        tableView.reloadData()
        
    }

    private func loadData(){
        homePresenterObject?.loadTodo()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditItem" {
            if let item = sender as? Item {
                let toVC = segue.destination as! Edit
                toVC.item = item
            }
        }
    }

}

extension Home : PresenterToViewHomeProtocol {
    func sendDataToView(itemArray: [Item]) {
        self.itemArray = itemArray
        self.tableView.reloadData()
      
    }
}

extension Home : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homePresenterObject?.search(searchString: searchText)
    }
}

extension Home: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoTableViewCell

            let item = itemArray[indexPath.row]

            cell.taskLabel.text = item.task

            return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemArray[indexPath.row]
        performSegue(withIdentifier: "toEditItem", sender: item)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (contextualAction,view,bool) in
            let item = self.itemArray[indexPath.row]

            let alert = UIAlertController(title: "Delete", message: "\(item.task) Are You Sure ?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)

            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.homePresenterObject?.delete(id: item.id)
                self.loadData()
                tableView.reloadData()
            }
            alert.addAction(yesAction)

            self.present(alert, animated: true)
        }

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}
