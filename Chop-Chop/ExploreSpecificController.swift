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
    
    @IBOutlet weak var back: UIButton!
    
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
            gradientLayer.frame = self.view.bounds
           
           gradientLayer.colors = [blueColor.cgColor, greenColor.cgColor]
           self.view.layer.insertSublayer(gradientLayer, at: 0)
           
       }
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
    
    @IBAction func backClick(_ sender: Any) {
        newStoryboard()
    }
    
    func newStoryboard() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "explore") ; // MySecondSecreen the storyboard ID
            self.present(vc, animated: true, completion: nil);
    }

}
