//
//  AddViewController.swift
//  ToDoList
//
//  Created by Екатерина Свиридо on 28.01.24.
//

import UIKit

class AddViewController: UIViewController {
    
    private let manager = CoreManager.shared
    var note: Note?
    
    lazy var titlField: UITextField = {
        let title = UITextField()
        title.placeholder = "Title"
        title.text = note?.title ?? ""
        title.translatesAutoresizingMaskIntoConstraints = false
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
        title.backgroundColor = .gray
        
        return title
    }()
    
    lazy var textView: UITextView = {
        let title = UITextView()
        title.text = note?.text ?? ""
        title.translatesAutoresizingMaskIntoConstraints = false
        title.heightAnchor.constraint(equalToConstant: 100).isActive = true
        title.backgroundColor = .gray
        title.font = UIFont.systemFont(ofSize: 16)
        
        return title
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(primaryAction: action)
        btn.setTitle("save", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    lazy var action = UIAction { _ in
        if self.note == nil {
            self.manager.addNewNote(title: self.titlField.text ?? "", text: self.textView.text)
        } else {
            self.note?.updateNote(newTitle: self.titlField.text ?? "", newText: self.textView.text)
        }
        
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Add"
        view.addSubview(titlField)
        view.addSubview(textView)
        view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            titlField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titlField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            titlField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            textView.topAnchor.constraint(equalTo: titlField.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            btn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])


    }
    

}
