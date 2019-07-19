//
//  MoreInfoVCPresenter.swift
//  RandomizedFoodInfo
//
//  Created by Marco Giustozzi on 2019-07-13.
//  Copyright © 2019 marcog. All rights reserved.
//

import UIKit

class MoreInfoVCPresenter {
    
    weak var router: Router?
    
}

extension MoreInfoVCPresenter: MoreInfoVCPresenterProtocol {
    func goTo() {
        
    }
    
    
}

protocol MoreInfoVCPresenterProtocol {
    func goTo()
}
