//
//  CommonFunctions.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 26/06/21.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension String {
    var isEmailValid: Bool {
        let emailRegEx = "[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
      let minPasswordLength = 6
      return self.count >= minPasswordLength
    }
}

extension UIApplication {
  func setRootVC(_ viewController: UIViewController){
      self.windows.first?.rootViewController = viewController
      self.windows.first?.makeKeyAndVisible()
    }
}

class CommonFunctions: NSObject {
    func setUpRootViewController(_ viewController: UIViewController) {
        UIApplication.shared.setRootVC(viewController)
    }
}
