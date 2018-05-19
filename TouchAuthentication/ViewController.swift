//
//  ViewController.swift
//  TouchAuthentication
//
//  Created by Pushpendra Khandelwal on 18/05/18.
//  Copyright © 2018 Pushpendra Khandelwal. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func authWithTouchId(_ sender: Any) {
        // 1
        let context = LAContext()
        var error: NSError?
        

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate with Touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason,
                                   reply: { [unowned self] (success, error) in
                                        if success {
                                            self.showAlertController("Touch ID Authentication Succeeded")
                                        }
                                        else {
                                            self.showAlertController("Touch ID Authentication Failed")
                                        }
                                    })
        }
        else {
            showAlertController("Touch ID not available")
        }
    }
    
    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

