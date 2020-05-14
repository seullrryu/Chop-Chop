//
//  StartViewController.swift
//  Chop-Chop
//
//  Created by Seulmin Andy Ryu on 5/3/20.
//  Copyright © 2020 Seulmin Ryu. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseUI
import FirebaseFirestore
import SwiftyJSON
import Alamofire

class StartViewController: UIViewController {
    @IBOutlet weak var ingredients: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Once you go back to start, clear all the previous scans
//        var scans = Scans.allScans
//        scans.removeAll()
//        print(scans)
        
        var inputs = Input.allInputs
        inputs.removeAll()
    }

    @IBAction func logout(_ sender: Any) {
        print("Signing Out")
        GIDSignIn.sharedInstance().signOut()
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "loginView") ; // MySecondSecreen the storyboard ID
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil);
    }
    @IBAction func generate(_ sender: Any) {
        let allIngredients = ingredients.text!
        let ingredientsArray = allIngredients.components(separatedBy: ",")
        var temp = [String]()
        for string in ingredientsArray {
            Input.allInputs.append(string.trimmingCharacters(in: .whitespacesAndNewlines))
            temp.append(string.trimmingCharacters(in: .whitespacesAndNewlines))
        }
        let db = Firestore.firestore();
        var ref: DocumentReference? = nil
        ref = db.collection("userData").addDocument(data: [
            "id": userToken,
            "ingredients": temp
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
