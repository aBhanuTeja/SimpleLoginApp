//
//  SignInVC.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 24/06/21.
//

import UIKit

class SignInVC: UIViewController {

    lazy var loginHeaderLbl: CommonLabel = {
       let label = CommonLabel()
        label.text = "Login"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()

    lazy var loginContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var emailTF: CommonTextField = {
        let txtField = CommonTextField()
        txtField.placeholder = "E-Mail"
        return txtField
    }()

    lazy var passwordTF: CommonTextField = {
        let txtField = CommonTextField()
        txtField.placeholder = "Password"
        txtField.isSecureTextEntry = true
        return txtField
    }()

    lazy var forgotPasswordBtn: CommonSecondaryButton = {
        let button = CommonSecondaryButton()
        button.setTitle("Forgot password?", for: .normal)
        button.addTarget(self, action: #selector(forgotPasswordClicked), for: .touchUpInside)
        return button
    }()

    lazy var signInBtn: CommonPrimaryButton = {
        let btn = CommonPrimaryButton(type: .system)
        btn.setTitle("Sign In", for: .normal)
        btn.addTarget(self, action: #selector(signInClicked), for: .touchUpInside)
        return btn
    }()

    lazy var dontHaveAccount: CommonLabel = {
       let label = CommonLabel()
        label.text = "Don't have an account?"
        return label
    }()
    
    lazy var createOneBtn: CommonSecondaryButton = {
        let button = CommonSecondaryButton()
        button.setTitle("Create one", for: .normal)
        button.addTarget(self, action: #selector(createOneClicked), for: .touchUpInside)
        return button
    }()

    lazy var superStackView: CommonStackView = {
        let stack = CommonStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fill
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setUpViews()
        setUpAutoLayout()
    }

    private func setUpViews() {
        loginContentView.addSubview(loginHeaderLbl)
        loginContentView.addSubview(emailTF)
        loginContentView.addSubview(passwordTF)
        loginContentView.addSubview(forgotPasswordBtn)
        loginContentView.addSubview(signInBtn)
        superStackView.addArrangedSubview(dontHaveAccount)
        superStackView.addArrangedSubview(createOneBtn)
        loginContentView.addSubview(superStackView)
        view.backgroundColor = .white
        view.addSubview(loginContentView)
    }

    private func setUpAutoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            loginContentView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 20),
            loginContentView.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -20),
            loginContentView.heightAnchor.constraint(equalToConstant: 500),
            loginContentView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30),

            loginHeaderLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            loginHeaderLbl.topAnchor.constraint(equalTo: loginContentView.topAnchor, constant: 40),
            loginHeaderLbl.heightAnchor.constraint(equalToConstant: 50),
            
            emailTF.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 0),
            emailTF.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: 0),
            emailTF.heightAnchor.constraint(equalToConstant: 40),
            emailTF.topAnchor.constraint(equalTo: loginHeaderLbl.bottomAnchor, constant: 40),

            passwordTF.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 0),
            passwordTF.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: 0),
            passwordTF.heightAnchor.constraint(equalToConstant: 40),
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 20),

            forgotPasswordBtn.rightAnchor.constraint(equalTo: passwordTF.rightAnchor, constant: 0),
            forgotPasswordBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 10),

            signInBtn.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 0),
            signInBtn.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: 0),
            signInBtn.heightAnchor.constraint(equalToConstant: 50),
            signInBtn.topAnchor.constraint(equalTo: forgotPasswordBtn.bottomAnchor, constant: 30),

            superStackView.centerXAnchor.constraint(equalTo: loginContentView.centerXAnchor),
            superStackView.topAnchor.constraint(equalTo: signInBtn.bottomAnchor, constant: 30),
        ])
    }

    @objc func signInClicked() {
        if !emailTF.text!.isEmailValid {
            showAlert("Email is not valid")
            return
        }
        if !passwordTF.text!.isValidPassword {
            showAlert("Password is not valid")
            return
        }
        proceedForSignIn()
    }

    private func proceedForSignIn() {
        SignInModel.sharedInstance().signInAuth(emailStr: emailTF.text!, password: passwordTF.text!) { userData, errorStr in
            if userData != nil {
                CommonFunctions().setUpRootViewController(ContainerVC())
            } else {
                self.showAlert(errorStr!)
            }
        }
    }

    @objc func forgotPasswordClicked() {
        if !emailTF.text!.isEmailValid {
            showAlert("Email is not valid")
            return
        }
        proceedForForgotPassword()
    }

    private func proceedForForgotPassword() {
        SignInModel.sharedInstance().forgotPasswordAuth(emailTF.text!) { successStr, errorStr in
            if successStr != nil {
                self.showAlert(successStr!)
            } else {
                self.showAlert(errorStr!)
            }
        }
    }

    @objc func createOneClicked() {
        let vc = SignUpVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
