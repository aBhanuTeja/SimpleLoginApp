//
//  SignUpVC.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 25/06/21.
//

import UIKit

class SignUpVC: UIViewController {

    lazy var registerHeaderLbl: UILabel = {
       let label = UILabel()
        label.text = "Register"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var signUpContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var firstNameTF: CommonTextField = {
        let txtField = CommonTextField()
        txtField.placeholder = "First Name"
        return txtField
    }()

    lazy var lastNameTF: CommonTextField = {
        let txtField = CommonTextField()
        txtField.placeholder = "Last Name"
        return txtField
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

    lazy var signUpBtn: CommonPrimaryButton = {
        let btn = CommonPrimaryButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)
        return btn
    }()

    lazy var alreadyHaveAccount: CommonLabel = {
       let label = CommonLabel()
        label.text = "Already have an account?"
        return label
    }()
    
    lazy var signInBtn: CommonSecondaryButton = {
        let button = CommonSecondaryButton()
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(signInClicked), for: .touchUpInside)
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
        signUpContentView.addSubview(registerHeaderLbl)
        signUpContentView.addSubview(firstNameTF)
        signUpContentView.addSubview(lastNameTF)
        signUpContentView.addSubview(emailTF)
        signUpContentView.addSubview(passwordTF)
        signUpContentView.addSubview(signUpBtn)
        superStackView.addArrangedSubview(alreadyHaveAccount)
        superStackView.addArrangedSubview(signInBtn)
        signUpContentView.addSubview(superStackView)
        view.backgroundColor = .white
        view.addSubview(signUpContentView)
    }

    private func setUpAutoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            signUpContentView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 20),
            signUpContentView.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -20),
            signUpContentView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 10),
            signUpContentView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30),
            
            registerHeaderLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            registerHeaderLbl.topAnchor.constraint(equalTo: signUpContentView.topAnchor, constant: 40),
            registerHeaderLbl.heightAnchor.constraint(equalToConstant: 50),

            firstNameTF.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 0),
            firstNameTF.rightAnchor.constraint(equalTo: signUpContentView.rightAnchor, constant: 0),
            firstNameTF.heightAnchor.constraint(equalToConstant: 40),
            firstNameTF.topAnchor.constraint(equalTo: registerHeaderLbl.bottomAnchor, constant: 30),

            lastNameTF.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 0),
            lastNameTF.rightAnchor.constraint(equalTo: signUpContentView.rightAnchor, constant: 0),
            lastNameTF.heightAnchor.constraint(equalToConstant: 40),
            lastNameTF.topAnchor.constraint(equalTo: firstNameTF.bottomAnchor, constant: 30),

            emailTF.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 0),
            emailTF.rightAnchor.constraint(equalTo: signUpContentView.rightAnchor, constant: 0),
            emailTF.heightAnchor.constraint(equalToConstant: 40),
            emailTF.topAnchor.constraint(equalTo: lastNameTF.bottomAnchor, constant: 30),

            passwordTF.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 0),
            passwordTF.rightAnchor.constraint(equalTo: signUpContentView.rightAnchor, constant: 0),
            passwordTF.heightAnchor.constraint(equalToConstant: 40),
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 30),

            signUpBtn.leftAnchor.constraint(equalTo: signUpContentView.leftAnchor, constant: 0),
            signUpBtn.rightAnchor.constraint(equalTo: signUpContentView.rightAnchor, constant: 0),
            signUpBtn.heightAnchor.constraint(equalToConstant: 50),
            signUpBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 40),

            superStackView.centerXAnchor.constraint(equalTo: signUpContentView.centerXAnchor),
            superStackView.topAnchor.constraint(equalTo: signUpBtn.bottomAnchor, constant: 30),
        ])
    }

    @objc func signUpClicked() {
        if !emailTF.text!.isEmailValid {
            showAlert("Email is not valid")
            return
        }
        if !passwordTF.text!.isValidPassword {
            showAlert("Password is not valid")
            return
        }
        proceedForSignUp()
    }

    @objc func signInClicked() {
        CommonFunctions().setUpRootViewController(UINavigationController(rootViewController: SignInVC()))
    }

    private func proceedForSignUp() {
        SignUpModel.sharedInstance().signUpAuth(emailStr: emailTF.text!, password: passwordTF.text!, firstName: firstNameTF.text!, lastName: lastNameTF.text!) { userData, errorStr in
            if userData != nil {
                CommonFunctions().setUpRootViewController(ContainerVC())
            } else {
                self.showAlert(errorStr!)
            }
        }
    }
}
