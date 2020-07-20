//
//  NetworkManager.swift
//  ReachabilitySwift
//
//  Created by Mohamed Samir on 7/20/20.
//  Copyright © 2020 Mohamed Samir. All rights reserved.
//



import Foundation
import Reachability

/*This class will store the network status and be a simple proxy to the Reachability package.*/
class NetworkManager: NSObject {

    // Initialise reachability
    var reachability: Reachability!
    
    static let sharedInstance: NetworkManager = { return NetworkManager() }()
    
    
    override init() {
        super.init()

        reachability = try! Reachability()

         // Register an observer for the network status
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        
        do {
            // Start the network status notifier
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    @objc func networkStatusChanged(_ notification: Notification) {
        // Do something globally here!
    }
    
     // Stop the network status notifier
    static func stopNotifier() -> Void {
        do {
            try (NetworkManager.sharedInstance.reachability).startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }

       // Network is reachable
    static func isReachable(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection != .unavailable {
            completed(NetworkManager.sharedInstance)
        }
    }
    
      // Network is unreachable
    static func isUnreachable(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .unavailable {
            completed(NetworkManager.sharedInstance)
        }
    }
    
     // Network is reachable via WWAN/Cellular
    static func isReachableViaWWAN(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .cellular {
            completed(NetworkManager.sharedInstance)
        }
    }

       // Network is reachable via WiFi
    static func isReachableViaWiFi(completed: @escaping (NetworkManager) -> Void) {
        if (NetworkManager.sharedInstance.reachability).connection == .wifi {
            completed(NetworkManager.sharedInstance)
        }
    }
}
