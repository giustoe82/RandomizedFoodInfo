//
//  ViewController.swift
//  RandomizedFoodInfo
//
//  Created by Marco Giustozzi on 2019-07-12.
//  Copyright © 2019 marcog. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol?

    @IBOutlet weak var shakeLabel: UILabel!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: {
            timer in
            self.introAnimation()
        })
    }
    
    //Shake gesture
    override func becomeFirstResponder() -> Bool {
        return true
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            print("Shake Gesture Detected")
            shakeLabel.stopShake()
            timer?.invalidate()
            presenter?.goToProductView()
        }
    }
    
    func introAnimation() {
        shakeLabel.shake()
    }
    
}

