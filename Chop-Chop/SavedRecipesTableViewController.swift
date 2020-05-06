//
//  SavedRecipesTableViewController.swift
//  Chop-Chop
//
//  Created by Jane Kim on 5/6/20.
//  Copyright © 2020 Seulmin Ryu. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

var indexArray1 = [30,31,32,33]
       var urlArray1 = [String]()
       var nameArray1 = [String]()
var imageArray = [UIImage]()
var savedRecipeArray = [SavedRecipe]()

class SavedRecipesTableViewController: UITableViewController {
    
    //MARK: Properties
    
    
    //array of saved recipes
    //var savedRecipeArray = [SavedRecipe]()
    
    //temp hardcoded saved recipes for now
    
    
    //MARK: Private Methods
    
    func loadSavedRecipes() {
        
        var indexArray1 = [30,31,32,33]
        var urlArray1 = [String]()
        var nameArray1 = [String]()
        var imageArray1 = [UIImage]()
        
        for i in indexArray1 {
            let url = jsonArray[i]["image"].stringValue
            urlArray1.append(url)
            
            let name = jsonArray[i]["name"].stringValue
            nameArray1.append(name)
            /*
            if let url = URL(string:url) {
                do {
            let data = try Data(contentsOf: url)
            
                let tempImage = UIImage(data: data)!
                imageArray1.append(tempImage)
                    //imageArray1[i] = UIImage(data:data)!
            }
            catch let err{
                print("error", err)
                
            }
            }
            savedRecipeArray.append(nil)
        }
        for i in savedRecipeArray {
            let SR = SavedRecipe(recipeName: nameArray1[i], recipeImage: imageArray1[i])
            savedRecipeArray.append(SR)
                    
    
            let SR = SavedRecipe(recipeName: name, recipeImage: tempImage)
            savedRecipeArray.append(SR)
    */
            
            
            //imageArray1.append()
            
        }
        /*
        var SR1 = SavedRecipe(recipeName: nameArray1[0], recipeImage: imageArray[0])
        savedRecipeArray[0] = SR1
        var SR2 = SavedRecipe(recipeName: nameArray1[1], recipeImage: imageArray[1])
        savedRecipeArray[1] = SR2
        var SR3 = SavedRecipe(recipeName: nameArray1[2], recipeImage: imageArray[2])
        savedRecipeArray[2] = SR3
        var SR4 = SavedRecipe(recipeName: nameArray1[3], recipeImage: imageArray[3])
        savedRecipeArray[3] = SR4
 */
        
        if let url = URL(string:urlArray1[0]) {
            do {
                let data = try Data(contentsOf: url)
                imageArray[0] = UIImage(data:data)!
                
            }
            catch let err{
                print("error", err)
            }
        }
        if let url = URL(string:urlArray1[1]) {
            do {
                let data = try Data(contentsOf: url)
                imageArray[1] = UIImage(data:data)!
            }
            catch let err{
                print("error", err)
            }
        }
        if let url = URL(string:urlArray1[2]) {
            do {
                let data = try Data(contentsOf: url)
                imageArray[2] = UIImage(data:data)!
            }
            catch let err{
                print("error", err)
            }
        }
        if let url = URL(string:urlArray1[3]) {
            do {
                let data = try Data(contentsOf: url)
                imageArray[3] = UIImage(data:data)!
            }
            catch let err{
                print("error", err)
            }
        }
            
        var SR1 = SavedRecipe(recipeName: nameArray1[0], recipeImage: imageArray[0])
        savedRecipeArray[0] = SR1
        var SR2 = SavedRecipe(recipeName: nameArray1[1], recipeImage: imageArray[1])
        savedRecipeArray[1] = SR2
        var SR3 = SavedRecipe(recipeName: nameArray1[2], recipeImage: imageArray[2])
        savedRecipeArray[2] = SR3
        var SR4 = SavedRecipe(recipeName: nameArray1[3], recipeImage: imageArray[3])
        savedRecipeArray[3] = SR4
 
    }

        
        
        //SavedRecipe(recipeName: nameArray1[0] )
        
        
        
        //create savedRecipe objects
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
       // }
        
        
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSavedRecipes()
    }
        /*
        
        var indexArray1 = [30,31,32,33]
        var urlArray1 = [String]()
        var nameArray1 = [String]()
        
        for i in indexArray1 {
            let url = jsonArray[i]["image"].stringValue
            urlArray1.append(url)
            
            let name = jsonArray[i]["name"].stringValue
            nameArray1.append(name)
        }
        
        //use URLs to get images from json array
        if let url = URL(string: urlArray[0]) {
            do {
               let data = try Data(contentsOf: url)
                
                ////self.img1.setImage(UIImage
            }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        }
 */
 

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return savedRecipeArray.count
    }
 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return savedRecipeArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        _ = "SavedRecipeTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedRecipeTableViewCell", for: indexPath) as! SavedRecipeTableViewCell
        let sRecipe = savedRecipeArray[indexPath.row]
        cell.SavedRecipeName.text = sRecipe.recipeName
        cell.savedRecipeImage.image = sRecipe.recipeImage
        //cell.textLabel?.text = "Cell Row: \(indexPath.row) Section: \(indexPath.section)"

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
