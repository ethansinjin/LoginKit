//
//  LoginKitRootViewController.swift
//  LoginKit
//
//  Created by Ethan eLink on 10/4/16.
//  Copyright © 2016 Ethan Gill. All rights reserved.
//

import UIKit

public enum LoginKitErrorIndication {
    case username
    case password
}

public class LoginKitRootViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBackgroundView: LoginKitSlantedView!
    @IBOutlet weak var loginButton: UIButton!
    
    var backgroundImage: UIImage?
    var logoImage: UIImage?
    var buttonBackgroundColor: UIColor?
    var buttonTextColor: UIColor?
    var buttonText: String?
    var callback: ((_ username:String, _ password:String) -> Void)?
    
    public convenience init(backgroundImage: UIImage, logoImage: UIImage, buttonBackgroundColor: UIColor, buttonTextColor: UIColor, buttonText: String, callback: @escaping (_ username:String, _ password:String) -> Void) {
        self.init(nibName: "LoginKitRootViewController", bundle: Bundle(for: type(of: self)))
        self.backgroundImage = backgroundImage
        self.logoImage = logoImage
        self.buttonBackgroundColor = buttonBackgroundColor
        self.buttonTextColor = buttonTextColor
        self.buttonText = buttonText
        self.callback = callback
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.image = backgroundImage
        logoImageView.image = logoImage
        loginBackgroundView.backgroundColor = buttonBackgroundColor
        loginButton.setTitleColor(buttonTextColor, for: .normal)
        // Do any additional setup after loading the view.
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInPressed(_ sender: AnyObject) {
        //guard text exists
        
        guard let username = usernameTextField.text,
            let password = passwordTextField.text else {
            // TODO: show an error message
            return
        }
        
        if let callback = callback {
            callback(username, password)
        }
    }
    
    public func indicateError(error: LoginKitErrorIndication) {
        switch error {
        case .username:
            break
            //turn username field red
        default:
            // turn password field red
            break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
