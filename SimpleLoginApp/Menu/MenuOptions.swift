//
//  MenuOptions.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 13/07/21.
//

import UIKit

enum MenuOptions: Int, CustomStringConvertible {
    case Profile
    case Settings
    case Events
    case Logout
    
    var description: String {
        switch self {
        case .Profile:
            return "Profile"
        case .Settings:
            return "Settings"
        case .Events:
            return "Events"
        case .Logout:
            return "Logout"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile:
            return UIImage(named: "user")!
        case .Settings:
            return UIImage(named: "gear")!
        case .Events:
            return UIImage(named: "event")!
        case .Logout:
            return UIImage(named: "logout")! 
        }
    }
}
