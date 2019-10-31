//
//  profileViewController.swift
//  AUCConnect
//
//  Created by Grant Commodore on 10/3/19.
//  Copyright © 2019 Grant Commodore. All rights reserved.
//

import UIKit
import Firebase
class profileViewController: UIViewController {
  //variables
    
    @IBOutlet weak var profilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePic.layer.masksToBounds = true
        profilePic.layer.cornerRadius = profilePic.bounds.width / 2
        // Do any additional setup after loading the view.
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
