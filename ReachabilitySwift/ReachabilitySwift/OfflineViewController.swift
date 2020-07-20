//
//  OfflineViewController.swift
//  ReachabilitySwift
//
//  Created by Mohamed Samir on 7/20/20.
//  Copyright © 2020 Mohamed Samir. All rights reserved.
//

import UIKit

class OfflineViewController: UIViewController {
    
    let network = NetworkManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        network.reachability.whenReachable = { reachability in
            self.showMainController()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func showMainController() -> Void {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "MainController", sender: self)
        }
    }
}
