//
//  ExploreSpecificController.swift
//  Chop-Chop
//
//  Created by Matthew Rodgers on 5/6/20.
//  Copyright © 2020 Seulmin Ryu. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ExploreSpecificController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRecipeRequest(idOfRecipe: recipeID)
        nameLabel.text = recipeName
        if let url = URL(string:recipeImage) {
            do {
                let data = try Data(contentsOf: url)
                self.img.image = UIImage(data:data)
                
                //self.label1.text = nameArray[0]
            }
            catch let err {
                print("error", err)
            }
        }
    }
    
    func getRecipeRequest(idOfRecipe: String) {
        let url = "https://api.spoonacular.com/recipes/"
        let url2 = "/summary?apiKey=7416dc48fba247819ce90cd88a3974ec"
        let id = idOfRecipe
        
        let requestURL = url + id + url2
        print(requestURL)
        
        AF.request(requestURL, method: .get, encoding:JSONEncoding.default).responseData { response in
            guard let data = response.data else {return}
            let json = try? JSON(data: data)
            let stringJSON = json!["summary"].stringValue
            
            let str = stringJSON.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            print(str)
            self.label.text = str
        }
    }
}
