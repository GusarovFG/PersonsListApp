//
//  ContactsTableViewController.swift
//  PersonsListApp
//
//  Created by Фаддей Гусаров on 29.07.2021.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return MainTapBarViewController.persons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondScreenContactCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath)"
        for numberOfSection in 0..<MainTapBarViewController.persons.count {
            if indexPath == [numberOfSection, 0] {
                cell.textLabel?.text = "Phone: \(MainTapBarViewController.persons[numberOfSection].phonesNumber)"
            } else if indexPath == [numberOfSection, 1] {
                cell.textLabel?.text = "Email: \(MainTapBarViewController.persons[numberOfSection].email)"
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var titleOfHeader = ""
        
        for numberOfSection in 0..<MainTapBarViewController.persons.count {
            if section == numberOfSection {
               titleOfHeader =  "\(MainTapBarViewController.persons[numberOfSection].name) \(MainTapBarViewController.persons[numberOfSection].surname)"
            }
        }
        return titleOfHeader
    }
}
