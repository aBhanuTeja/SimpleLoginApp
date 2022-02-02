//
//  SignInSignUpVC.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 25/06/21.
//

import UIKit

class SignInSignUpVC: UIViewController {

    lazy var superStackView: CommonStackView = {
        let stack = CommonStackView(arrangedSubviews: [signInBtn, SignUpBtn])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var signInBtn: CommonPrimaryButton = {
        let btn = CommonPrimaryButton(type: .system)
        btn.setTitle("Sign In", for: .normal)
        btn.addTarget(self, action: #selector(signInClicked), for: .touchUpInside)
        return btn
    }()

    lazy var SignUpBtn: CommonPrimaryButton = {
        let btn = CommonPrimaryButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setUpAutoLayout()
    }

    func addViews() {
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        view.addSubview(superStackView)
    }

    func setUpAutoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            superStackView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 20),
            superStackView.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -20),
            superStackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -30),

            signInBtn.heightAnchor.constraint(equalToConstant: 50),
            
            SignUpBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc func signInClicked() {
        let vc = SignInVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func signUpClicked() {
        let vc = SignUpVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
