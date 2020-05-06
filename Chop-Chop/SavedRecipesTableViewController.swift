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

class SavedRecipesTableViewController: UITableViewController {
    
    //MARK: Properties
    //array of saved recipes
    var savedRecipeArray = [SavedRecipe]()
    
    //temp hardcoded saved recipes for now
    //img1: UIImageView!
    //img2: UIImageView!
    //img3: UIImageView
    //img4: UIImageView
    
    //MARK: Private Methods
    private func loadSampleSavedRecipes(){
        
        
    }
    
    private func loadSavedRecipes() {
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var indexArray = [30,31,32,33]
        var urlArray = [String]()
        var nameArray = [String]()
        
        for i in indexArray {
            let url = jsonArray[i]["image"].stringValue
            urlArray.append(url)
            
            let name = jsonArray[i]["name"].stringValue
            nameArray.append(name)
        }
        
        //use URLs to get images from json array
        if let url = URL(string: urlArray[0]) {
            do {
               // let data = try Data(contentsOf: url)
                
                ////self.img1.setImage(UIImage
            }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
