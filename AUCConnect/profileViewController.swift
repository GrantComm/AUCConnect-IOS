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
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var profilePic: UIImageView!
    
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
        if (user != nil) {
            print("Hello World")
        }
    }
    
    
    @IBAction func signout(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "signinView", sender: self)

                
            } catch let error as NSError {
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
