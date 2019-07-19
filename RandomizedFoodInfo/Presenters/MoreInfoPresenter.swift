//
//  MoreInfoPresenter.swift
//  RandomizedFoodInfo
//
//  Created by Marco Giustozzi on 2019-07-15.
//  Copyright © 2019 marcog. All rights reserved.
//

import UIKit

class MoreInfoPresenter {
    
    weak var router: Router?
    
}

extension MoreInfoPresenter: MoreInfoPresenterProtocol {
    func navigateHome() {
        router?.navigateHome()
    }
    
}

protocol MoreInfoPresenterProtocol {
    func navigateHome()
    
}
