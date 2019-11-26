//
//  signinViewController.swift
//  AUCConnect
//
//  Created by Grant Commodore on 10/5/19.
//  Copyright © 2019 Grant Commodore. All rights reserved.
//

import UIKit
import Firebase
class signinViewController: UIViewController {

    
    @IBOutlet weak var emailSignInTextField: UITextField!
    @IBOutlet weak var passwordSignInTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tappedSignIn(_ sender: UIButton, forEvent event: UIEvent) {
        let loginManager = FirebaseAuthManager()
        let alert = UIAlertController(title: nil, message: "Email/Password cannot be empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        var message: String = ""
        
        guard let email = emailSignInTextField.text, let password = passwordSignInTextField.text else {
            return }
        if(email == "" || password == ""){
            self.present(alert, animated: true, completion: nil)
        }
        loginManager.signIn(email: email, pass: password) {[weak self] (success) in
            guard let `self` = self else { return }
            if (success) {
                self.performSegue(withIdentifier: "profileView", sender: self)
            } else {
                message = "We don't know who you are. Please try again."
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
