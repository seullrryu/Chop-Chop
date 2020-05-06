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

        if let url = URL(string:urlArray[0]) {
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
    
    @IBAction func backClick(_ sender: Any) {
        newStoryboard()
    }
    
    func newStoryboard() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "explore") ; // MySecondSecreen the storyboard ID
            self.present(vc, animated: true, completion: nil);
    }

}
