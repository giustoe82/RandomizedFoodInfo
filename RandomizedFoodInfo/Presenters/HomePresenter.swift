//
//  HomePresenter.swift
//  RandomizedFoodInfo
//
//  Created by Marco Giustozzi on 2019-07-12.
//  Copyright © 2019 marcog. All rights reserved.
//

import UIKit

class HomePresenter {
    
    weak var router: Router?
    
}

extension HomePresenter: HomePresenterProtocol {
    
    func goToProductView() {
        router?.goToProductView()
    }
    
}

protocol HomePresenterProtocol {
    func goToProductView()
}
