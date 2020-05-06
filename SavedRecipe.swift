//
//  SavedRecipe.swift
//  
//
//  Created by Jane Kim on 5/6/20.
//

import UIKit

class SavedRecipe {
    //MARK: Properties
    //the saved recipe's name, image
    
    var recipeName: String
    var recipeImage: UIImage?
    
    //MARK: Initialization
    
    init(recipeName: String, recipeImage: UIImage? ){
        //If initialization should fail ...
        //
        
        //Otherwise, initialize the Saved Recipe's Name and Image
        self.recipeName = recipeName
        self.recipeImage = recipeImage
    }
}
