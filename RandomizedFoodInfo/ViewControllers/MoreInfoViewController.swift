//
//  MoreInfoVC.swift
//  RandomizedFoodInfo
//
//  Created by Marco Giustozzi on 2019-07-13.
//  Copyright © 2019 marcog. All rights reserved.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    var presenter: MoreInfoPresenterProtocol?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var potassiumLabel: UILabel!
    @IBOutlet weak var sodiumLabel: UILabel!
    @IBOutlet weak var cholesterolLabel: UILabel!
    @IBOutlet weak var satFatLabel: UILabel!
    @IBOutlet weak var unsatFatLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    
    var name = String()
    var desc = String()
    var potassium = Double()
    var sodium = Double()
    var cholesterol = Double()
    var satFat = Double()
    var unsatFat = Double()
    var sugar = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = name.uppercased()
        descLabel.text = desc
        potassiumLabel.text = String(potassium) + "mg"
        sodiumLabel.text = String(sodium) + "mg"
        cholesterolLabel.text = String(cholesterol) + "mg/dL"
        satFatLabel.text = String(satFat) + "gr"
        unsatFatLabel.text = String(unsatFat) + "gr"
        sugarLabel.text = String(sugar) + "%"
        
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        presenter?.navigateHome()
    }
    
}
