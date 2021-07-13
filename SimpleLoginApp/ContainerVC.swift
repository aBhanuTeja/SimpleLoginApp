//
//  ContainerVC.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 13/07/21.
//

import UIKit
import FirebaseAuth

protocol ContainerVCDelegate {
    func handleMenuToggle(menuOption: MenuOptions?)
}

class ContainerVC: UIViewController {

    private var centerController: UIViewController!
    private var menuController: MenuVC!
    private var isSlideInMenuPresented = false
    lazy var slideInMenuPadding: CGFloat = self.view.frame.width * 0.20

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHomeController()
    }
    
    private func setUpHomeController() {
        let homeVC = HomeVC()
        homeVC.delegate = self
        centerController = UINavigationController(rootViewController: homeVC)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    private func setUpMenuController() {
        if menuController == nil {
            menuController = MenuVC()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }

    private func showMenuController(shouldExpand: Bool, menuOption: MenuOptions?) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.centerController.view.frame.origin.x = shouldExpand ? self.centerController.view.frame.width - self.slideInMenuPadding : 0
        } completion: { (finished) in
            if !shouldExpand {
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
    }

    private func didSelectMenuOption(menuOption: MenuOptions) {
        switch menuOption {
        case .Profile:
            let profileVC = ProfileVC()
            profileVC.modalPresentationStyle = .fullScreen
            present(UINavigationController(rootViewController: profileVC), animated: true, completion: nil)
        case .Settings:
            print("tapped on Settings")
        case .Events:
            print("tapped on Events")
        case .Logout:
            do {
                try Auth.auth().signOut()
                CommonFunctions().setUpRootViewController(UINavigationController(rootViewController: SignInVC()))
            } catch {
                print("Sign out error")
            }
        }
    }
}

extension ContainerVC: ContainerVCDelegate {
    func handleMenuToggle(menuOption: MenuOptions?) {
        if !isSlideInMenuPresented {
            setUpMenuController()
        }
        isSlideInMenuPresented.toggle()
        showMenuController(shouldExpand: isSlideInMenuPresented, menuOption: menuOption)
    }
}
