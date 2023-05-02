//
//  ViewController.swift
//  Register_HomeWork
//
//  Created by Jane Strashok on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let inputContent: [(name: String, image: UIImage?)] =
    [("Full name", UIImage(systemName: "person")),
     ("Phone", UIImage(systemName: "iphone")),
     ("Email", UIImage(systemName: "envelope")),
     ("Password", UIImage(systemName: "lock")),
     ("Confirm password", UIImage(systemName: "lock"))]

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
    }
    
    private func configTable() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "InputTableViewCell", bundle: nil), forCellReuseIdentifier: "InputTableViewCell")
        
        tableView.backgroundColor = .clear
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        inputContent.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InputTableViewCell", for: indexPath) as? InputTableViewCell else {
            return UITableViewCell()
        }
        
        cell.inputImage.image = inputContent[indexPath.section].image ?? UIImage()

        let textFieldView = AnimatedTextField(name: inputContent[indexPath.section].name)
        cell.addSubview(textFieldView)
        
        cell.backgroundColor = .clear
        cell.contentView.layer.cornerRadius = 12
        
        cell.contentView.layer.masksToBounds = true
        return cell
    }
}



