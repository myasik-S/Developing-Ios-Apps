//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Aleksandr Myasoedov on 05.11.2020.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
   
//Marc: Meal Class Test
    
//    Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testMealInitializationSucceeds(){
        
//        Zero rating.
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
//        Highest positive rating
        let positiveRatinMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatinMeal)
    }
    
//    Confirm that the Meal initialier returns nil  when passed a negative rating or an empty name.
    func testMealInitializationFails(){
        
//        Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
//        Ratinng exeeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
//        Empty String
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    }
    
    
    
}
