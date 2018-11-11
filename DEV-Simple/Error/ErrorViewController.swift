//
//  LoadingViewController.swift
//  DEV-Simple
//
//  Created by Ceri-anne Jackson on 11/11/2018.
//  Copyright © 2018 DEV. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {
    
    let reachability = ReachabilityManager.shared

    @IBAction func retry(_ sender: Any) {
        dismiss()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged), name: .reachabilityChanged, object: nil)
        super.viewWillAppear(animated)
    }
    
    @objc func reachabilityChanged() {
        dismiss()
    }
    
    func dismiss() {
        if let presentingVC = presentingViewController as? CanReload {
            presentingVC.reload()
        }
        self.dismiss(animated: true)
    }
    
}
