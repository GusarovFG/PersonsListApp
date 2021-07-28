//
//  ContactViewController.swift
//  PersonsListApp
//
//  Created by Фаддей Гусаров on 28.07.2021.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var person: Person?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "\(person?.name ?? "" ) \(person?.surname ?? "" )"
        phoneLabel.text = "Phone: \(person?.phonesNumber ?? "")"
        emailLabel.text = "Email: \(person?.email ?? "" )"
//        fillingLabels()

    }
//
//    private func fillingLabels() {
//        self.navigationItem.title = "\(person.name ) \(person.surname )"
//        phoneLabel.text = "Phone: \(person.phonesNumber )"
//        emailLabel.text = "Email: \(person.email )"
//    }

}

