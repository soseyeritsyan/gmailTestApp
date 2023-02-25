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
    
    @IBOutlet weak var warningMessageView: UIView!
    @IBOutlet weak var attencionImageView: UIImageView!
    @IBOutlet weak var warningMessageLabel: UILabel!
    
    @IBOutlet weak var showPasswordButton: UIButton!
    
    @IBOutlet weak var showPasswordLabel: UILabel!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet var nextButtonBottomConstraint: NSLayoutConstraint!
    
    var user: UserModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    func setupUI() {
        self.hideKeyboardWhenTappedAround()

        self.navigationController?.isNavigationBarHidden = true

        NotificationCenter.default.addObserver(self,
                            selector: #selector(self.keyboardWillShow),
                            name: UIResponder.keyboardWillShowNotification,
                            object: nil)

             
        NotificationCenter.default.addObserver(self,
                   selector: #selector(self.keyboardWillHide),
                   name: UIResponder.keyboardWillHideNotification,
                   object: nil)
        
        self.warningMessageView.isHidden = true

        
        self.emailLabel.text = self.user?.email
        
        self.nextButton.layer.cornerRadius = 4

        self.passwordTextField.isSecureTextEntry = true
        self.showPasswordButton.isSelected = false
        
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
        self.passwordTextField.isSecureTextEntry.toggle()
        self.showPasswordButton.isSelected.toggle()
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        guard let password = self.passwordTextField.text else { return }
        if password == self.user?.password {
            print("woow")
        } else {
            if password.isEmpty {
                self.warningMessageLabel.text = "Input your password"
            } else {
                self.warningMessageLabel.text =
                """
                    Your password is wrong. Try again or click on "Forgot password"
                """

            }
            self.passwordTextField.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)

        }
    }
    
}
