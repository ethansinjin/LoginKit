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
    @IBOutlet weak var scrollView: UIScrollView!
    
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
        
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardShown(_:)), name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardHidden(_:)), name: .UIKeyboardWillHide, object: nil)
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
    
    func keyboardShown(_ notification:NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size {
                let insets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
                scrollView.contentInset = insets
                scrollView.scrollIndicatorInsets = insets
                
                var frameRect = self.view.frame
                frameRect.size.height -= keyboardSize.height
                
                if !frameRect.contains(passwordTextField.frame.origin) {
                    scrollView.scrollRectToVisible(passwordTextField.frame, animated: true)
                }
            }
        }
    }
    
    func keyboardHidden(_ notification:NSNotification) {
        let insets = UIEdgeInsets.zero
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
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
