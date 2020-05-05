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
    
    @IBOutlet weak var viewForLayer: UIView!
    var gradientLayer: CAGradientLayer!
    var blueColor = UIColor(red:0.0, green: (228/255), blue:1.0, alpha: 0.5 )
    var greenColor = UIColor(red:(105/255), green: (255/255), blue: (151/255), alpha: 0.5)
    
    var x = 0
    var y = -30
    var w = 414
    var h = 300
    
    
    @IBOutlet weak var GButton: UIButton!
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = 80.0
        gradientLayer.frame = CGRect(x: x, y:y, width: w, height: h)
        
        gradientLayer.colors = [blueColor.cgColor, greenColor.cgColor]
        self.view.layer.addSublayer(gradientLayer)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayer()
    }
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

