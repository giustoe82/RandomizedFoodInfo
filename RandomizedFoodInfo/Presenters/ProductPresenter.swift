//
//  ProductPresenter.swift
//  RandomizedFoodInfo
//
//  Created by Marco Giustozzi on 2019-07-15.
//  Copyright © 2019 marcog. All rights reserved.
//

import UIKit

class ProductPresenter {
    
    weak var router: Router?
    
}

extension ProductPresenter: ProductPresenterProtocol {
    
    func goToMoreInfoView(food: CurrentFood) {
        router?.goToMoreInfoView(food: food)
    }
    
    func navigateHome() {
        router?.navigateHome()
    }
    
}

protocol ProductPresenterProtocol {
    func goToMoreInfoView(food: CurrentFood)
    func navigateHome()
    
}
