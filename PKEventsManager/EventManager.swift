//
//  EventManager.swift
//  PayKeyApp
//
//  Created by Eran Israel on 28/05/2018.
//  Copyright © 2018 PayKey. All rights reserved.
//

import Foundation
import Mixpanel

@objc final public class EventManager: NSObject {

    static let excludedEvents = ["key_pressed", "keyboard"]
    
    @objc public static let shared = EventManager()

    private override init() {
        super.init()
    }

    @objc public func track(event: String, properties: [String: String]? = nil) {
        if !isInternetConnectionOn() {
            return
        }
        guard !EventManager.excludedEvents.contains(event) else {
            return
        }
        print("[PayKey: Analytics *Sanitized*] \(event) : \(String(describing: properties))/")
        
        Mixpanel.mainInstance().track(event: event, properties: properties)
    }
    
    @objc public func initialize(token:String) {
        Mixpanel.initialize(token: token)
    }

    private func isInternetConnectionOn() -> Bool {
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            return false
        case .online(.wwan):
            print("Connected via WWAN")
            return true
        case .online(.wiFi):
            print("Connected via WiFi")
            return true
        }
    }

}
