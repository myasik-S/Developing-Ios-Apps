//
//  Meal.swift
//  FoodTracker
//
//  Created by Aleksandr Myasoedov on 06.11.2020.
//

import UIKit
class Meal{
    
//    Mark: Propirties
    var name: String
    var photo: UIImage?
    var rating: Int
    
//    Marc: Initialization
    init?(name: String, photo: UIImage?, rating: Int){
       
//       The name must not be empty
        guard !name.isEmpty else{
            return nil
        }
        
//        The ratinng must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else{
            return nil
        }
        
//        Mark: Initialize store propirties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
