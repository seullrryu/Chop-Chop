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

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    let urlKey = "https://spoonacular.com/recipeImages/594403-312x231.jpg"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        print("exploreHere")
        // Choose 4 random recipes from the recipee in the database
        let length = recipes.count
        var indexArray = [Int]()
        var urlArray = [String]()
        var nameArray = [String]()
        
        var index1 = Int.random(in: 0 ..< length)
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
            let url = recipes[i]["image"] as! String
            urlArray.append(url)
            
            let name = recipes[i]["name"] as! String
            nameArray.append(name)
        }
        
        
//        print(urlArray)
        
        if let url = URL(string:urlArray[0]) {
            do {
                let data = try Data(contentsOf: url)
                self.img1.image = UIImage(data:data)
                self.label1.text = nameArray[0]
            }
            catch let err {
                print("error", err)
            }
        }
        
        if let url = URL(string:urlArray[1]) {
            do {
                let data = try Data(contentsOf: url)
                self.img2.image = UIImage(data:data)
                self.label2.text = nameArray[1]
            }
            catch let err {
                print("error", err)
            }
        }
        
        if let url = URL(string:urlArray[2]) {
            do {
                let data = try Data(contentsOf: url)
                self.img3.image = UIImage(data:data)
                self.label3.text = nameArray[2]
            }
            catch let err {
                print("error", err)
            }
        }
        
        if let url = URL(string:urlArray[3]) {
            do {
                let data = try Data(contentsOf: url)
                self.img4.image = UIImage(data:data)
                self.label4.text = nameArray[3]
            }
            catch let err {
                print("error", err)
            }
        }
        
        
        // IMPORTANT
        // Look below to see how to parse JSON
        
        //print(jsonRecipes[0])
        //print(jsonArray[2])
        print(jsonArray[22]["name"])
        print(jsonArray[22]["missedIngredients"][0]["name"])
        print(jsonArray[22]["name"].stringValue)
        
        // or go here
        // https://github.com/SwiftyJSON/SwiftyJSON
        // For video tutorial
        // https://www.youtube.com/watch?v=Rqr3w8scm2E
        

    }
}
