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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load all the scans
//        var scans = Scans.allScans
        
        var scans = ["Honey", "Butter", "Potato", "Chicken", "Cheese"]
        
        //MARK: Implement matching algorithm
        for recipe in jsonArray {
            var string = ""
            var name = recipe["name"].stringValue
            var allOriginalStrings = ""
            
            for ingredient in recipe["missedIngredients"] {
                let json = JSON(ingredient.1)
                string += json["name"].stringValue + ", "
                allOriginalStrings += json["originalString"].stringValue + ", "
            }
            
            for ingredient in recipe["usedIngredients"] {
                let json = JSON(ingredient.1)
                string += json["name"].stringValue + ", "
                allOriginalStrings += json["originalString"].stringValue + ", "
            }
            
            var counter = 0
            for ingredient in scans {
                if (string.contains(ingredient.lowercased())) {
                   counter += 1
               }
            }
            
            let current = Recipe(name:name, originalString:allOriginalStrings, image:recipe["image"].stringValue, ingredients:string, count: counter)
            allRecipes.append(current)
        }
        
        print(allRecipes[2].ingredients)
        print(allRecipes[2].count)
        
        //Connect them back to the view controller, make a table view of all the recipes
        let array = allRecipes.sorted { $0.count < $1.count }
        print(array)
    }
}
