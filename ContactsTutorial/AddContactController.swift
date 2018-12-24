//
//  AddContactController.swift
//  ContactsTutorial
//
//  Created by Stephen Dowless on 12/24/18.
//  Copyright © 2018 Stephan Dowless. All rights reserved.
//


import UIKit

// MARK: - AddContactDelegate Protocol

protocol AddContactDelegate {
    func addContact(contact: Contact)
}

class AddContactController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: AddContactDelegate?
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Full Name"
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    // MARK: - Init 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        view.addSubview(textField)
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        
        textField.becomeFirstResponder()
    }
    
    // MARK: - Selectors
    
    @objc func handleDone() {
        
        guard let fullname = textField.text, textField.hasText else {
            print("Handle error here..")
            return
        }
        
        let contact = Contact(fullname: fullname)
        
        delegate?.addContact(contact: contact)
    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
