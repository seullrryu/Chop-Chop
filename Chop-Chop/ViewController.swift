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
import FirebaseFirestore

var recipes = Recipes.recipes

class ViewController: UIViewController {
    
    @IBOutlet weak var GButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let mainPage = self.storyboard!.instantiateViewController(withIdentifier: "Start") as! UIViewController
//        
//        UIApplication
//        
//        self.window?.rootViewController = mainPage
//        self.window?.makeKeyAndVisible()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()

        let gSignIn = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 230, height: 48))
            gSignIn.center = view.center
            view.addSubview(gSignIn)
        
        //Pulling recipes from database
        let db = Firestore.firestore();
        
        db.collection("items").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    //print("\(document.documentID) => \(document.data())")
                    //recipes.append("\(document.documentID) => \(document.data())")
                    recipes.append(document.data())
                }
//                print((recipes[2]))
            }
        }
    }
    
    
    
    //Sign out function we can use later on
    //Do something like UIButton.addTarget(self, action: #selector(self.signOut(_:)), for: .touchUpInside)
    //Referenced https://www.youtube.com/watch?v=BjsJNpgsl5c
    @objc func signOut(_ sender: UIButton) {
        print("Signing Out")
        GIDSignIn.sharedInstance().signOut()
    }
    
    func login() {
        self.performSegue(withIdentifier: "toStart", sender: nil)
    }
    
    
    
    
}

