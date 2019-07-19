//
//  Router.swift
//  RandomizedFoodInfo
//
//  Created by Marco Giustozzi on 2019-07-12.
//  Copyright © 2019 marcog. All rights reserved.
//

import UIKit

class Router {
    
    var rootController: HomeViewController?
    
    func goToProductView() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let productViewController = storyBoard.instantiateViewController(withIdentifier: "productVC") as? ProductViewController
        
        let presenter = ProductPresenter()
        presenter.router = self
        productViewController?.presenter = presenter
        
        rootController?.navigationController?.pushViewController(productViewController!, animated: true)
        
    }
    
    func goToMoreInfoView(food: CurrentFood) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let moreInfoViewController = storyBoard.instantiateViewController(withIdentifier: "moreInfoVC") as? MoreInfoViewController
        
        let presenter = MoreInfoPresenter()
        presenter.router = self
        moreInfoViewController?.presenter = presenter
        
        moreInfoViewController?.name = food.response.title
        moreInfoViewController?.desc = food.response.pcstext
        moreInfoViewController?.potassium = food.response.potassium
        moreInfoViewController?.sodium = food.response.sodium
        moreInfoViewController?.cholesterol = food.response.cholesterol
        moreInfoViewController?.satFat = food.response.saturatedfat
        moreInfoViewController?.unsatFat = food.response.unsaturatedfat
        moreInfoViewController?.sugar = food.response.sugar
        
        rootController?.navigationController?.pushViewController(moreInfoViewController!, animated: true)
        
    }
    
    func navigateHome() {
        rootController?.navigationController?.popToRootViewController(animated: true)
        
    }
    
}
