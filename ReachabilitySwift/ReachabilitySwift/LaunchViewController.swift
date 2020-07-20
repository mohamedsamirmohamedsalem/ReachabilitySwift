//
//  LaunchViewController.swift
//  ReachabilitySwift
//
//  Created by Mohamed Samir on 7/20/20.
//  Copyright © 2020 Mohamed Samir. All rights reserved.
//


import UIKit

class LaunchViewController: UIViewController {
    
    let network: NetworkManager = NetworkManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.isUnreachable { _ in
            self.showOfflinePage()
        }
        
        NetworkManager.isReachable { _ in
            self.showMainPage()
        }
    }
    
    private func showOfflinePage() -> Void {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "NetworkUnavailable", sender: self)
        }
    }
    
    private func showMainPage() -> Void {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "MainController", sender: self)
        }
    }
}


