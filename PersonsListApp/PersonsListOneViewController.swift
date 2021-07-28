//
//  PersonsListOneViewController.swift
//  PersonsListApp
//
//  Created by Фаддей Гусаров on 28.07.2021.
//

import UIKit

class PersonsListOneViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var persons: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatingPerson()
        print(persons)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        cell.textLabel?.text = "\(persons[indexPath.row].name) \(persons[indexPath.row].surname)"
        return cell
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
            
            persons.append(onePerson)
            
        }
    }
}
