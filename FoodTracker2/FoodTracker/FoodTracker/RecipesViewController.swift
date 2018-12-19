//
//  RecipesViewController.swift
//  FoodTracker
//
//  Created by Pravara Kant on 17/12/2018.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {

    let selectedMeal: Meal?
    @IBOutlet weak var recipeTitle: UILabel!
    
    init(meal: Meal) {
            self.selectedMeal = meal
        super.init(nibName: "RecipesViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.selectedMeal = aDecoder.decodeObject(forKey: "selectedMeal") as? Meal
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recipeTitle.text = selectedMeal?.name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
