//
//  AnimatedTextField.swift
//  Register_HomeWork
//
//  Created by Jane Strashok on 28.04.2023.
//

import UIKit

class AnimatedTextField: UIView {
    
    var name: String
    
    private var labelYAnchorConstraint: NSLayoutConstraint!
    private var textFieldYAnchorCondtraint: NSLayoutConstraint!
    
    private lazy var label: UILabel! = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        label.text = name
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.5
        return label
    }()
    
    private lazy var usernameTextField: UITextField! = {
        let textLabel = UITextField()
        textLabel.borderStyle = .none
        textLabel.textColor = .white
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    init(name: String) {
        self.name = name
        super.init(frame: CGRect(x: 41, y: 3, width: 290, height: 41))
        addSubview(usernameTextField)
        addSubview(label)
        backgroundColor = .clear
        usernameTextField.delegate = self
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        let margins = self.layoutMarginsGuide
        textFieldYAnchorCondtraint = usernameTextField.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: 0)
        labelYAnchorConstraint = label.centerYAnchor.constraint(equalTo: usernameTextField.centerYAnchor, constant: 0)
        
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            usernameTextField.widthAnchor.constraint(equalToConstant: 290),
            usernameTextField.heightAnchor.constraint(equalToConstant: 19),
            label.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor, constant: 0),
            
            textFieldYAnchorCondtraint,
            labelYAnchorConstraint,
        ])
    }
    
}

extension AnimatedTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        label.textColor = UIColor(red: 0.675, green: 0.675, blue: 0.675, alpha: 1)
        labelYAnchorConstraint.constant = -23
        textFieldYAnchorCondtraint.constant = 11
        
        performAnimation(transform: CGAffineTransform(scaleX: 1, y: 1))
        performAnimationForTextField(transform: CGAffineTransform(scaleX: 1, y: 1))
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, text.isEmpty {
            labelYAnchorConstraint.constant = 0
            textFieldYAnchorCondtraint.constant = 0
            
            performAnimation(transform: CGAffineTransform(scaleX: 1, y: 1))
        }
    }
    
    fileprivate func performAnimation(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.label.transform = transform
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    fileprivate func performAnimationForTextField(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.usernameTextField.transform = transform
            self.layoutIfNeeded()
        }, completion: nil)
    }
}
