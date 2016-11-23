//
//  ViewController.swift
//  LoginKitTest
//
//  Created by Ethan eLink on 10/17/16.
//  Copyright © 2016 Ethan Gill. All rights reserved.
//

import UIKit
import LoginKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button1Pressed(_ sender: AnyObject) {
        let loginViewController = LoginKitRootViewController(backgroundImage: UIImage(),
            logoImage: UIImage(),
            tintColor: #colorLiteral(red: 0.5948053598, green: 0.1391471922, blue: 0.164798677, alpha: 1),
            buttonTextColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            buttonText: "Login") {
            (username, password) in
                self.dismiss(animated: true, completion: nil)
            }
        self.present(loginViewController, animated: true, completion: nil)
    }

}
