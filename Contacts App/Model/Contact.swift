//
//  Contact.swift
//  Contacts App
//
//  Created by Byambadorj on 2025.11.06.
//

import Foundation
import SwiftData

@Model
class Contact: Identifiable {
    
    // Required field
    var firstName: String
    var lastName: String
    var email: String
    
   // Additional field
    
    var phoneNumber: String = ""
    var address: String = ""
    
    // Optional image
    @Attribute(.externalStorage)
    var avatar: Data?
    
    // Full name
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    init(
        firstName: String = "",
        lastName: String = "",
        email: String = "",
        phoneNumber: String = "",
        address: String = "",
        avatar: Data? = nil
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.address = address
        self.avatar = avatar
    }
    
    // Check if all input strings are empty
    func isEmpty() -> Bool {
        firstName.isEmpty &&
        lastName.isEmpty &&
        email.isEmpty &&
        phoneNumber.isEmpty &&
        address.isEmpty
    }
    
}
