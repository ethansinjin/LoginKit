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
    @IBOutlet weak var usernameTextField: LoginKitTextField!
    @IBOutlet weak var passwordTextField: LoginKitTextField!
    @IBOutlet weak var loginBackgroundView: LoginKitSlantedView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var backgroundImage: UIImage?
    var logoImage: UIImage?
    var interfaceTintColor: UIColor?
    var buttonTextColor: UIColor?
    var buttonText: String?
    var callback: ((_ username:String, _ password:String) -> Void)?
    
    public convenience init(backgroundImage: UIImage, logoImage: UIImage, tintColor: UIColor, buttonTextColor: UIColor, buttonText: String, callback: @escaping (_ username:String, _ password:String) -> Void) {
        self.init(nibName: "LoginKitRootViewController", bundle: Bundle(for: type(of: self)))
        self.backgroundImage = backgroundImage
        self.logoImage = logoImage
        self.interfaceTintColor = tintColor
        self.buttonTextColor = buttonTextColor
        self.buttonText = buttonText
        self.callback = callback
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.image = backgroundImage
        logoImageView.image = logoImage
        loginBackgroundView.backgroundColor = interfaceTintColor
        loginButton.setTitleColor(buttonTextColor, for: .normal)
        usernameTextField.tintColor = UIColor.white
        passwordTextField.tintColor = UIColor.white
        
//        usernameTextField.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
//        passwordTextField.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        usernameTextField.textColor = UIColor.white
        passwordTextField.textColor = UIColor.white
        
        
        let font = UIFont.systemFont(ofSize: 14.0)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.center
        paragraphStyle.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
        let attributes : [String: Any] = [
            NSFontAttributeName : font,
            NSParagraphStyleAttributeName : paragraphStyle,
            NSForegroundColorAttributeName: UIColor.white
        ]
        
        if let placeholder = usernameTextField.placeholder {
            usernameTextField.attributedPlaceholder = NSAttributedString(string:placeholder, attributes: attributes)
        }
        if let placeholder = passwordTextField.placeholder {
            passwordTextField.attributedPlaceholder = NSAttributedString(string:placeholder, attributes: attributes)
        }
        
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
