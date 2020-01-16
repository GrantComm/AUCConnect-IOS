//
//  profileViewController.swift
//  AUCConnect
//
//  Created by Grant Commodore on 10/3/19.
//  Copyright © 2019 Grant Commodore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
class profileViewController: UIViewController {
  //variables

    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var schoolBackground: UIImageView!
    @IBOutlet weak var roundedLogout: UIButton!
    
    var user = Auth.auth().currentUser;
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePic.layer.masksToBounds = true
        profilePic.layer.cornerRadius = profilePic.bounds.width / 2
        
        //Render the logout button
        roundedLogout.layer.cornerRadius = 10
        roundedLogout.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        // Do any additional setup after loading the view.
        let user = Auth.auth().currentUser;
        if let user = user{
            //Properties of the Current User
            let uid = user.uid
            let email = user.email
            let domainMH = "morehouse"
            let domainSP = "spelman"
            let domainCL = "cau"
            //Access the name of the user
            var delimiter1 = "@"
            var delimiter2 = "."
            var newstr = email!
            var token = newstr.components(separatedBy: delimiter1)
            var token2 = token[0].components(separatedBy: delimiter2)
            firstName.text = token2[0].uppercased()
            lastName.text = token2[1].uppercased()
            //Change Background color based on school
            let image0 = UIImage(named: "morehouse")
            let image1 = UIImage(named: "spelman")
            let image2 = UIImage(named: "clark")
            if(self.whichColor(testEmail: email!, domain: domainMH) == true){
                print("HELLO MH USER")
                schoolBackground.image = image0
            }
            if(self.whichColor(testEmail: email!, domain: domainSP) == true){
                print("HELLO SP USER")
                schoolBackground.image = image1
            }
            if(self.whichColor(testEmail: email!, domain: domainCL) == true){
                print("HELLO CL USER")
                schoolBackground.image = image2
            }
        }
    }
    
    
    
    func whichColor(testEmail:String, domain:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[\(domain)]+\\.[edu]{3,\(domain.count)}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testEmail)
        return result
        
    }
    
    @IBAction func signout(_ sender: Any, forEvent event: UIEvent) {
        if user != nil {
            do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "signinView", sender: self)
            } catch let error as NSError {
                print("Hello There")
                print(error.localizedDescription)
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
