//
//  UserModel.swift
//  GmailTestApp
//
//  Created by sose yeritsyan on 2/25/23.
//

import Foundation

struct UserModel {
    var email: String?
    var phoneNumber: String?
    var password: String?
    
//    init(email: String? = nil, phoneNumber: String? = nil, password: String? = nil) {
//        if isValidEmail(email: email) {
//            self.email = email
//
//        }
//        if isValidPhone(phone: phoneNumber) {
//            self.phoneNumber = phoneNumber
//
//        }
//        self.password = password
//    }
//
//    private func isValidPhone(phone: String?) -> Bool {
//            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
//            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
//            return phoneTest.evaluate(with: phone)
//        }
//
//    private func isValidEmail(email: String?) -> Bool {
//            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//            return emailTest.evaluate(with: email)
//        }
}
