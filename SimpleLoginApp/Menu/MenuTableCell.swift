//
//  MenuTableCell.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 13/07/21.
//

import UIKit

class MenuTableCell: UITableViewCell {

    lazy var imageIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

     lazy var labelMenu: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Some Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none 
        addSubview(imageIcon)
        addSubview(labelMenu)
        setUpAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpAutoLayout() {
        NSLayoutConstraint.activate([
            imageIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageIcon.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            imageIcon.heightAnchor.constraint(equalToConstant: 24),
            imageIcon.widthAnchor.constraint(equalToConstant: 24),
            
            labelMenu.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelMenu.leftAnchor.constraint(equalTo: imageIcon.rightAnchor, constant: 12),
        ])
    }
}
