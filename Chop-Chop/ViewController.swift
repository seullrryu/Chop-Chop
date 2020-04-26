//
//  ViewController.swift
//  Chop-Chop
//
//  Created by Seulmin Andy Ryu on 4/13/20.
//  Copyright © 2020 Seulmin Ryu. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseUI

class ViewController: UIViewController {
    
    @IBOutlet weak var GButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()

        
        
        let gSignIn = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 230, height: 48))
            gSignIn.center = view.center
            view.addSubview(gSignIn)
        
        
        
        
    }
  
    
    
    
    
    //Sign out function we can use later on
    //Do something like UIButton.addTarget(self, action: #selector(self.signOut(_:)), for: .touchUpInside)
    //Referenced https://www.youtube.com/watch?v=BjsJNpgsl5c
    @objc func signOut(_ sender: UIButton) {
        print("Signing Out")
        GIDSignIn.sharedInstance().signOut()
    }
    
    
    
    
}

