//
//  PotentialRecipesViewController.swift
//  Chop-Chop
//
//  Created by Seulmin Andy Ryu on 5/3/20.
//  Copyright © 2020 Seulmin Ryu. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

var allRecipes = [Recipe]()
class PotentialRecipesViewController: UIViewController {
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load all the scans
//        var scans = Scans.allScans
//        let inputs = Input.allInputs
//        print(inputs)
//        let scans = ["Honey", "Beef", "Potato", "Chicken", "Cheese"]
        
        //MARK: Implement matching algorithm
        for recipe in jsonArray {
            var string = ""
            let name = recipe["name"].stringValue
            var allOriginalStrings = ""
            
            for ingredient in recipe["missedIngredients"] {
                let json = JSON(ingredient.1)
                string += json["name"].stringValue.lowercased() + ", "
                allOriginalStrings += json["originalString"].stringValue + ", "
            }
            
            for ingredient in recipe["usedIngredients"] {
                let json = JSON(ingredient.1)
                string += json["name"].stringValue.lowercased() + ", "
                allOriginalStrings += json["originalString"].stringValue + ", "
            }
            
            var counter = 0
            for ingredient in Input.allInputs {
                if (string.contains(ingredient.lowercased())) {
                   counter += 1
               }
            }
            
            let current = Recipe(name:name, originalString:allOriginalStrings, image:recipe["image"].stringValue, ingredients:string, count: counter)
            allRecipes.append(current)
        }
            
        //Connect them back to the view controller, make a table view of all the recipes
        var array = allRecipes.sorted {  $0.count < $1.count }
        array = array.reversed()
        
        if let url = URL(string:array[0].image) {
            do {
                let data = try Data(contentsOf: url)
                self.img1.image = UIImage(data:data)
                self.label1.text = array[0].name
            }
            catch let err {
                print("error", err)
            }
        }
        if let url = URL(string:array[1].image) {
            do {
                let data = try Data(contentsOf: url)
                self.img2.image = UIImage(data:data)
                self.label2.text = array[1].name
            }
            catch let err {
                print("error", err)
            }
        }
        if let url = URL(string:array[2].image) {
            do {
                let data = try Data(contentsOf: url)
                self.img3.image = UIImage(data:data)
                self.label3.text = array[2].name
            }
            catch let err {
                print("error", err)
            }
        }
    }
}
