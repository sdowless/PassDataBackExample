//
//  ContactsControllers.swift
//  ContactsTutorial
//
//  Created by Stephen Dowless on 12/24/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//


import UIKit

private let reuseIdentifier = "Cell"

// MARK: Contact

struct Contact {
    var fullname: String
}

class ContactsController: UITableViewController {
    
    // MARK: - Properties
    
    var contacts = [Contact]()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Contacts"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddContact))
        
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView(frame: .zero)
        
    }
    
    // MARK: - Selectors
    
    @objc func handleAddContact() {
        
        let controller = AddContactController()
        controller.delegate = self
        
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].fullname
        return cell
    }
}

// MARK: - AddContactDelegate

extension ContactsController: AddContactDelegate {
    
    func addContact(contact: Contact) {
        self.dismiss(animated: true) {
            self.contacts.append(contact)
            self.tableView.reloadData()
        }
    }
}
