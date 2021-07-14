//
//  MenuVC.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 12/07/21.
//

import UIKit

class MenuVC: UIViewController {

    lazy var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MenuTableCell.self, forCellReuseIdentifier: "MenuTableCell")
        tableView.rowHeight = 50
        return tableView
    }()

    var delegate: ContainerVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }
    
    private func addViews() {
        view.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.0)
        view.addSubview(menuTableView)
        setUpAutoLayout()
    }
    
   private func setUpAutoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            menuTableView.leftAnchor.constraint(equalTo: guide.leftAnchor),
            menuTableView.rightAnchor.constraint(equalTo: guide.rightAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            menuTableView.topAnchor.constraint(equalTo: guide.topAnchor),
        ])
    }
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableCell", for: indexPath) as! MenuTableCell
        let menuData = MenuOptions(rawValue: indexPath.row)
        cell.labelMenu.text = menuData?.description
        cell.imageIcon.image = menuData?.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuData = MenuOptions(rawValue: indexPath.row)
        delegate?.handleMenuTap(menuOption: menuData)
    }
}
