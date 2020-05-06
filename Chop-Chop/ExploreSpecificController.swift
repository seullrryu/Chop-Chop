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
