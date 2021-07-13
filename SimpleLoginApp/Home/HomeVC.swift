//
//  HomeVC.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 27/06/21.
//

import UIKit
import FirebaseAuth

class HomeVC: UIViewController {

    lazy var sampleLbl: CommonLabel = {
        let lbl = CommonLabel()
        lbl.text = "Welcome to Home screen \(currentUser!.email!)"
        return lbl
    }()
    
    lazy var slideInMenuPadding: CGFloat = self.view.frame.width * 0.20
    var delegate: ContainerVCDelegate?
    private let currentUser = Auth.auth().currentUser
    lazy var button = UIBarButtonItem(image: UIImage(named: "menu-icon")?.withRenderingMode(.alwaysOriginal),
                                      style: .done, target: self, action: #selector(menuBtnClicked))

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
    }

    func addViews() {
        view.backgroundColor = .white
        view.addSubview(sampleLbl)
        setUpAutoLayout()
    }

    func setUpNavigationBar() {
        title = "Home"
        navigationItem.leftBarButtonItem  = button
        addViews()
    }
    
    @objc func menuBtnClicked() {
        delegate?.handleMenuToggle(menuOption: nil)
    }
    
    func setUpAutoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            sampleLbl.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            sampleLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor)
        ])
    }
}
