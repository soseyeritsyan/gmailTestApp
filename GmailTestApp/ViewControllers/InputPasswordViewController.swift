//
//  InputPasswordViewController.swift
//  GmailTestApp
//
//  Created by sose yeritsyan on 2/24/23.
//

import UIKit

class InputPasswordViewController: UIViewController {
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    @IBOutlet weak var showPasswordLabel: UILabel!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet var nextButtonBottomConstraint: NSLayoutConstraint!
    var user: UserModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupUI() {
        self.navigationController?.isNavigationBarHidden = true

        self.nextButton.layer.cornerRadius = 4
            
        self.hideKeyboardWhenTappedAround()

        NotificationCenter.default.addObserver(self,
                            selector: #selector(self.keyboardWillShow),
                            name: UIResponder.keyboardWillShowNotification,
                            object: nil)

             
        NotificationCenter.default.addObserver(self,
                   selector: #selector(self.keyboardWillHide),
                   name: UIResponder.keyboardWillHideNotification,
                   object: nil)
        
        self.passwordTextField.layer.borderWidth = 1
        self.passwordTextField.layer.cornerRadius = 4
        self.passwordTextField.layer.borderColor = .init(red: 77, green: 77, blue: 77, alpha: 0.5)
    }
    
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.nextButtonBottomConstraint.constant = keyboardSize.height + 10
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
            self.nextButtonBottomConstraint.constant = 40
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
    }
    
    @IBAction func showPasswordAction(_ sender: UIButton) {
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
    }
    
}
