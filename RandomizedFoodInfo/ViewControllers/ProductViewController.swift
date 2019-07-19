//
//  ProductVC.swift
//  Lifesum Challenge
//
//  Created by Marco Giustozzi on 2019-07-13.
//  Copyright © 2019 marcog. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    var presenter: ProductPresenterProtocol?
    
    private let apiManager = APIManager()
    
    var foodObject: CurrentFood?
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var circleView: DesignableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    
    var name: String?
    var calories: Double?
    var carbs: Double?
    var protein: Double?
    var fat: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        activityIndicator.startAnimating()
        let randomInt = Int.random(in: 1..<201)
        let id = String(randomInt)
        let urlString = "https://api.lifesum.com/v2/foodipedia/codetest?foodid=" + id
        print(urlString)
        getFood(urlString: urlString)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let food = foodObject {
            nameLabel.text = food.response.title.uppercased()
            caloriesLabel.text = String(food.response.calories)
            carbsLabel.text = String(food.response.carbs) + "%"
            proteinLabel.text = String(food.response.protein) + "%"
            fatLabel.text = String(food.response.fat) + "%"
            activityIndicator.stopAnimating()
            loadingView.isHidden = true
        } else {
            displayAlert(title: "Error", message:"There was a problem fetching the data. Retry.")
        }

    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.presenter?.navigateHome()
        }))
        self.present(alert, animated: true, completion: nil)
    }
 
    
    @IBAction func moreInfoButtonAction(_ sender: Any) {
        presenter?.goToMoreInfoView(food: foodObject!)
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        presenter?.navigateHome()
    }
    
}

extension ProductViewController {
    
    private func getFood(urlString: String) {
        apiManager.getFood(urlString: urlString) { (food, error) in
            if let error = error {
                print("Get food error: \(error.localizedDescription)")
                return
            }
            guard let food = food  else { return }
            //print("Current Food Object:")
            //print(food)
            self.foodObject = food
        }
    }
    
}

