//
//  CommonSignInSignUpModel.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 09/07/21.
//

import Foundation
import FirebaseAuth

class CommonSignInSignUpModel: NSObject {
    private static var commonSignInSignUpModel: CommonSignInSignUpModel?

    static func sharedInstance() -> CommonSignInSignUpModel {
        if commonSignInSignUpModel == nil {
            commonSignInSignUpModel = CommonSignInSignUpModel()
        }
        return commonSignInSignUpModel!
    }
    
    func getFirebaseErrorStr(error: NSError) -> String {
        switch AuthErrorCode(rawValue: error.code) {
        case .emailAlreadyInUse:
            return "The email address is already registered with us"
        case .invalidEmail:
            return "The E-Mail is invalid"
        case .invalidRecipientEmail:
            return "Invalid recipient email"
        case .invalidSender:
            return "Invalid sender email"
        case .invalidMessagePayload:
            return "Invalid message payload"
        case .invalidUserToken:
            return "Invalid token"
        case .operationNotAllowed:
            return "This operation is not valid at the moment"
        case .userDisabled:
            return "This account has been disabled by an admin"
        case .userNotFound:
            return "Invalid E-Mail. This E-Mail is not registered with us"
        case .weakPassword:
            return "The password must be 6 characters long or more."
        case .wrongPassword:
            return "The password is invalid"
        default:
            return error.localizedDescription
        }
    }
}
