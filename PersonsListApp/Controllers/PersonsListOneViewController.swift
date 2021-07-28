//
//  PersonsListOneViewController.swift
//  PersonsListApp
//
//  Created by Фаддей Гусаров on 28.07.2021.
//

import UIKit

class PersonsListOneViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var personsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatingPerson()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainTapBarViewController.persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        cell.textLabel?.text = "\(MainTapBarViewController.persons[indexPath.row].name) \(MainTapBarViewController.persons[indexPath.row].surname)"
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactSegue" {
            guard let contactVC = segue.destination as? ContactViewController else { return }
            guard let indexPath = personsTableView.indexPathForSelectedRow else { return }
            
            contactVC.person = Person(name: MainTapBarViewController.persons[indexPath.row].name,
                                      surname: MainTapBarViewController.persons[indexPath.row].surname,
                                      email: MainTapBarViewController.persons[indexPath.row].email,
                                      phonesNumber: MainTapBarViewController.persons[indexPath.row].phonesNumber)
        }
    }
}

extension PersonsListOneViewController {
    
    private func creatingPerson() {
        for _ in 1...DataManager.names.count {
            let onePerson = Person(name: DataManager.names.randomElement() ?? "",
                                   surname: DataManager.surnames.randomElement() ?? "",
                                   email: DataManager.emails.randomElement() ?? "" , phonesNumber: DataManager.phoneNumbers.randomElement() ?? "")
            
            DataManager.names = DataManager.names.filter({ $0 != onePerson.name })
            DataManager.surnames = DataManager.surnames.filter({ $0 != onePerson.surname })
            DataManager.emails = DataManager.emails.filter({ $0 != onePerson.email })
            DataManager.phoneNumbers = DataManager.phoneNumbers.filter({ $0 != onePerson.phonesNumber })
            
            MainTapBarViewController.persons.append(onePerson)
            
        }
    }
}
