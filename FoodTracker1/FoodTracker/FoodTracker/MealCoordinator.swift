//
//  MealCoordinator.swift
//  FoodTracker
//
//  Created by Pravara Kant on 18/12/2018.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import UIKit
import os.log

protocol MealCoordinatorDelegate {
    
    func loadSampleMeals() -> [Meal]
    func save(meals: [Meal])
}

class MealCoordinator: MealCoordinatorDelegate{
    
    func loadSampleMeals() -> [Meal] {
        
        var meals = [Meal]()
        
        // Load any saved meals, otherwise load sample data.
        if let savedMeals = loadMeals() {
            meals += savedMeals
        }
        else {
            // Load the sample data.
            meals = createSampleMeals()
        }
        
        return meals
    }
    
    func save(meals: [Meal]) {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Meals successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }

    //MARK: Private Methods
    
    private func createSampleMeals() -> [Meal] {
        
        var meals = [Meal]()
        
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal2")
        }
        
        meals += [meal1, meal2, meal3]
        return meals
    }
    
    private func loadMeals() -> [Meal]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL.path) as? [Meal]
    }
}
