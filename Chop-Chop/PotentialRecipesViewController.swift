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

var recipes = Recipes.recipes
class PotentialRecipesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load all the scans
//        var scans = Scans.allScans
        
        var scans = ["Eggs", "Butter", "Potato", "Onions", "Cheese"]
        
        //MARK: Implement matching algorithm
        
        //Make a dictionary with all ingredients
        var ingredients = Dictionary<String, String>();
        
        for recipe in jsonArray {
            var string = ""
            var name = recipe["name"].stringValue
            
            for ingredient in recipe["missedIngredients"] {
                let json = JSON(ingredient.1)
                string += json["name"].stringValue + ", "
            }
            
            for ingredient in recipe["usedIngredients"] {
                let json = JSON(ingredient.1)
                string += json["name"].stringValue + ", "
            }
            ingredients[name] = string
        }
        
        print(ingredients["Cocktail Friday: Rosemary Martini + Frozen Grapes"])
        //Spit out the recipes that matched
        
        
        
        
        //Connect them back to the view controller, make a table view of all the recipes
    }
}
