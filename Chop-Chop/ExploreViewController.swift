//
//  ExploreViewController.swift
//  Chop-Chop
//
//  Created by Seulmin Andy Ryu on 5/4/20.
//  Copyright © 2020 Seulmin Ryu. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

//Global Variables
var recipeID = ""
var idArray = [String]()
var urlArray = [String]()


class ExploreViewController: UIViewController {
    
 
    @IBOutlet weak var img1: UIButton!
    
    @IBOutlet weak var img2: UIButton!
    @IBOutlet weak var img3: UIButton!
    @IBOutlet weak var img4: UIButton!
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Choose 4 random recipes from the recipee in the database
        let length = jsonArray.count
        
        var indexArray = [Int]()
        
        var nameArray = [String]()
        
        let index1 = Int.random(in: 0 ..< length)
        indexArray.append(index1)
        
        var index2 = 0
        repeat {
            index2 = Int.random(in: 0 ..< length)
        } while indexArray.contains(index2)
        indexArray.append(index2)
        
        var index3 = 0
        repeat {
            index3 = Int.random(in: 0 ..< length)
        } while indexArray.contains(index3)
        indexArray.append(index3)
        
        var index4 = 0
        repeat {
            index4 = Int.random(in: 0 ..< length)
        } while indexArray.contains(index4)
        indexArray.append(index4)
                
        
        for i in indexArray {
            let url = jsonArray[i]["image"].stringValue
            urlArray.append(url)
            
            let name = jsonArray[i]["name"].stringValue
            nameArray.append(name)
            
            let id = jsonArray[i]["id"].stringValue
            idArray.append(id)
        }
        
        
//        print(urlArray)
        
        if let url = URL(string:urlArray[0]) {
            do {
                let data = try Data(contentsOf: url)
                self.img1.setImage(UIImage(data:data), for: .normal)
                self.label1.text = nameArray[0]
            }
            catch let err {
                print("error", err)
            }
        }
        
        if let url = URL(string:urlArray[1]) {
            do {
                let data = try Data(contentsOf: url)
                self.img2.setImage(UIImage(data:data), for: .normal)
                self.label2.text = nameArray[1]
            }
            catch let err {
                print("error", err)
            }
        }
        
        if let url = URL(string:urlArray[2]) {
            do {
                let data = try Data(contentsOf: url)
                self.img3.setImage(UIImage(data:data), for: .normal)
                self.label3.text = nameArray[2]
            }
            catch let err {
                print("error", err)
            }
        }
        
        if let url = URL(string:urlArray[3]) {
            do {
                let data = try Data(contentsOf: url)
                self.img4.setImage(UIImage(data:data), for: .normal)
                self.label4.text = nameArray[3]
            }
            catch let err {
                print("error", err)
            }
        }
        
        
        // IMPORTANT
        // Look below to see how to parse JSON
        
//        print(jsonArray[22]["name"])
//        print(jsonArray[22]["missedIngredients"][0]["name"])
//        print(jsonArray[22]["name"].stringValue)
        
        // or go here
        // https://github.com/SwiftyJSON/SwiftyJSON
        // For video tutorial
        // https://www.youtube.com/watch?v=Rqr3w8scm2E
        
        
        
        

    }
    @IBAction func img1Click(_ sender: Any) {
        print(idArray[0])
        recipeID = idArray[0]
        newStoryboard()
    }
    @IBAction func img2Click(_ sender: Any) {
        print(idArray[1])
        recipeID = idArray[1]
        newStoryboard()
        
    }
    @IBAction func img3Click(_ sender: Any) {
        print(idArray[2])
        recipeID = idArray[2]
        newStoryboard()
    }
    @IBAction func img4Click(_ sender: Any) {
       print(idArray[3])
        recipeID = idArray[3]
        newStoryboard()
    }
    
    func newStoryboard() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "exploreSpecific") ; // MySecondSecreen the storyboard ID
            self.present(vc, animated: true, completion: nil);
    }
    
    
}
