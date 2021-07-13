//
//  SignInModel.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 26/06/21.
//

import Foundation
import FirebaseAuth

class SignInModel: NSObject {
    private static var signInModel: SignInModel?

    static func sharedInstance() -> SignInModel {
        if signInModel == nil {
            signInModel = SignInModel()
        }
        return signInModel!
    }

    func signInAuth(emailStr: String, password: String, completion: @escaping (User?, String?) -> ()) {
        Auth.auth().signIn(withEmail: emailStr, password: password) { authResult, error in
            if let error = error as NSError? {
                let strError = CommonSignInSignUpModel.sharedInstance().getFirebaseErrorStr(error: error)
                completion(nil, strError)
          } else {
            let newUserInfo = Auth.auth().currentUser
            completion(newUserInfo, nil)
          }
        }
    }

    func forgotPasswordAuth(_ emailStr: String, completion: @escaping (String?, String?) -> ()) {
        Auth.auth().sendPasswordReset(withEmail: emailStr) { (error) in
            if let error = error as NSError? {
                let strError = CommonSignInSignUpModel.sharedInstance().getFirebaseErrorStr(error: error)
                completion(nil, strError)
            } else {
                let successStr = "Reset password link has been sent to your registered E-Mail. Please check your Inbox"
                completion(successStr, nil)
            }
        }
    }
}
