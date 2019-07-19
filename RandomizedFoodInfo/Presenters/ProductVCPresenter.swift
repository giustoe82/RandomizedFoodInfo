//
//  ProductVCPresenter.swift
//  Lifesum Challenge
//
//  Created by Marco Giustozzi on 2019-07-13.
//  Copyright © 2019 marcog. All rights reserved.
//

import UIKit

class ProductVCPresenter {
    
    weak var router: Router?
    
}

extension ProductVCPresenter: ProductVCPresenterProtocol {
    func goToMoreInfoView(food: CurrentFood) {
        //router?.goToMoreInfoView(food: food)
    }
    
}

protocol ProductVCPresenterProtocol {
    func goToMoreInfoView(food: CurrentFood)
}
