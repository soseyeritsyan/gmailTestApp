//
//  InputEmailViewController.swift
//  GmailTestApp
//
//  Created by sose yeritsyan on 2/24/23.
//

import UIKit

class InputEmailViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var logInLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    @IBOutlet weak var moreInfoButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var warningMessageView: UIView!
    @IBOutlet weak var attentionImageView: UIImageView!
    @IBOutlet weak var warningMessageLabel: UILabel!
    
    @IBOutlet weak var forgetEmailButton: UIButton!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nextButtonBottomConstraint: NSLayoutConstraint!

    var user = UserModel(email: "test.email@gmail.com",
                         phoneNumber: "+37498765432",
                         password: "testPassword123",
                         mailArray:  [
                            MailModel(sender: "Google",
                                      title: "Security alert",
                                      mailText: "You logged in from another device. If its not you, please click the link down below."),
                            
                            MailModel(sender: "Ani",
                                      title: "Lectures",
                                      mailText: "I send you all lectures, if you have any question please ask me."),
//                            
                            MailModel(sender: "Elon Musk",
                                      title: "Twitter",
                                      mailText: "Dear Sose Yeritsyan, Please check your twitter account. And if you have any question feel free to ask me")
                            
                            ]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let inputPasswordViewController = segue.destination as? InputPasswordViewController {
            inputPasswordViewController.user = self.user
        }
    }
    

    func setupUI() {
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
           
        
        self.warningMessageView.isHidden = true
        
        self.emailTextField.layer.borderWidth = 1
        self.emailTextField.layer.cornerRadius = 4
        self.emailTextField.layer.borderColor = .init(red: 77, green: 77, blue: 77, alpha: 0.5)
        
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.nextButtonBottomConstraint.constant = keyboardSize.height + 10
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
            self.nextButtonBottomConstraint.constant = 40
    }
    
    // Actions
    @IBAction func moreInfoAction(_ sender: UIButton) {
    }
    
    @IBAction func forgetEmailAction(_ sender: UIButton) {
    }
    
    @IBAction func createAcountAction(_ sender: UIButton) {
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        guard let emailOrPhone = self.emailTextField.text else { return }
        
        if emailOrPhone == self.user.email || emailOrPhone == self.user.phoneNumber {
            // open InputPasswordViewController
            self.performSegue(withIdentifier: "openInputPasswordFromInputLogin",
                              sender: nil)

        } else {
            self.warningMessageView.isHidden = false
            self.emailTextField.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        }
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
