//
//  SignUpModel.swift
//  SimpleLoginApp
//
//  Created by Bhanuteja on 26/06/21.
//

import Foundation
import FirebaseAuth
import Firebase

class SignUpModel: NSObject {
    private static var signUpModel: SignUpModel?

    static func sharedInstance() -> SignUpModel {
        if signUpModel == nil {
            signUpModel = SignUpModel()
        }
        return signUpModel!
    }

    func signUpAuth(emailStr: String, password: String, firstName: String, lastName: String,
                    completion: @escaping (User?, String?) -> ()) {
        Auth.auth().createUser(withEmail: emailStr, password: password) { authResult, error in
            if let error = error as NSError? {
                let strError = CommonSignInSignUpModel.sharedInstance().getFirebaseErrorStr(error: error)
                completion(nil, strError)
          } else {
            let newUserInfo = authResult?.user
            self.handleFireStore(firstName: firstName, lastName: lastName, uID: newUserInfo!.uid) { status, msg in
                if !status {
                    completion(nil, msg)
                } else {
                    completion(newUserInfo, nil)
                }
            }
          }
        }
    }

    func handleFireStore(firstName: String, lastName: String, uID: String,
                         completion: @escaping (Bool, String?) -> ()) {
        let db = Firestore.firestore()
        let collectedData = ["firstName": firstName, "lastName": lastName, "uid": uID]
        db.collection("users").addDocument(data: collectedData) { error in
            if let error = error as NSError? {
                let strError = CommonSignInSignUpModel.sharedInstance().getFirebaseErrorStr(error: error)
                completion(false, strError)
            } else {
                completion(true, nil)
            }
        }
    }
}
