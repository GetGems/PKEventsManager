//
//  ViewController.swift
//  PKEventsManagerExample
//
//  Created by Eran Israel on 09/06/2020.
//  Copyright © 2020 Paykey. All rights reserved.
//

import UIKit
import PKEventsManager

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        EventManager.shared.initialize(token: "")
    }
    
    func reportEvent(with name:String, params:[String:String]) {
        EventManager.shared.track(event: "", properties: params)
    }
}

