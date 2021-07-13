//
//  ProfileVC.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 13/07/21.
//

import UIKit

class ProfileVC: UIViewController {

    lazy var sampleLbl: CommonLabel = {
        let lbl = CommonLabel()
        lbl.text = "Welcome to profile screen"
        return lbl
    }()

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
        title = "Profile"
        addViews()
    }

    func setUpAutoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            sampleLbl.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            sampleLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor)
        ])
    }
}
