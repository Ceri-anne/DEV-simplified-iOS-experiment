//
//  ReachabilityManager.swift
//  DEV-Simple
//
//  Created by Ceri-anne Jackson on 11/11/2018.
//  Copyright © 2018 DEV. All rights reserved.
//

import Reachability

class ReachabilityManager {
    
    static let shared = ReachabilityManager()
    private init() { }
    
    private let reachability = Reachability()
    
    func isConnected() -> Bool {
        
        guard let reachability = reachability else {
            print("Error with reachability")
            return false
        }
        
        switch reachability.connection {
        case .none:
            return false
        case .cellular, .wifi:
            return true
        }
    }

    
    func start() {
        
        guard let reachability = reachability else {
            print("Error with reachability")
            return
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("could not start reachability notifier")
        }
    }
    
}
