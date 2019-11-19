//
//  registerViewController.swift
//  AUCConnect
//
//  Created by Grant Commodore on 10/2/19.
//  Copyright © 2019 Grant Commodore. All rights reserved.
//

import UIKit

class registerViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func isValidEmail(testEmail:String, domain:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[\(domain)]+\\.[edu]{3,\(domain.count)}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testEmail)
        return result
        
    }
    
    @IBAction func registerClick(_ sender: Any, forEvent event: UIEvent) {
        print("Hello World")
        let domainM = "morehouse"
        let domainS = "spelman"
        let domainC = "cau"
        let signUpManager = FirebaseAuthManager()
        if let email = emailTextField.text, let password = passwordTextField.text {
            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                guard let `self` = self else { return }
                var message: String = ""
                if (success) {
                    if(self.isValidEmail(testEmail: email, domain: domainM) == true){
                        message = "Morehouse user was sucessfully created."
                    }
                    if(self.isValidEmail(testEmail: email, domain: domainS) == true){
                        message = "Spelman user was sucessfully created."
                    }
                    if(self.isValidEmail(testEmail: email, domain: domainC) == true){
                        message = "Clark Atlanta user was sucessfully created."
                    }
                }
                else {
                    message = "There was an error."
                }
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

