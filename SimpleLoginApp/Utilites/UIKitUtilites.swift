//
//  UIKitUtilites.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 05/07/21.
//

import UIKit

@IBDesignable class CommonPrimaryButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        self.tintColor = .white
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@IBDesignable class CommonSecondaryButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(.blue, for: .normal)
        self.titleLabel?.font = self.titleLabel?.font.withSize(18)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@IBDesignable class CommonTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.borderStyle = .bezel
        self.autocorrectionType = .no
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@IBDesignable class CommonLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = .black
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.systemFont(ofSize: 18)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@IBDesignable class CommonStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.distribution = .fill
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
