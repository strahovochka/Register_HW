//
//  InputTableViewCell.swift
//  Register_HomeWork
//
//  Created by Jane Strashok on 28.04.2023.
//

import UIKit

class InputTableViewCell: UITableViewCell {
    
    var textField = AnimatedTextField()
    
    @IBOutlet weak var inputImage: UIImageView!
    
    override func awakeFromNib() {
        self.addSubview(textField)
        textField.delegate = self
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension InputTableViewCell: AnimatedTextFieldProtocol {
    func endEditing(_ textField: UITextField) {
        if let text = textField.text, text.isEmpty {
            UIView.animate(withDuration: 0.5) {
                self.contentView.backgroundColor = UIColor(red: 0.179, green: 0.179, blue: 0.179, alpha: 1)
            }
        }
    }
    
    func startedEditing() {
        UIView.animate(withDuration: 0.5) {
            self.contentView.backgroundColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        }
    }
}
