//
//  NameAndEmailView.swift
//  Contacts App
//
//  Created by Byambadorj on 2025.11.10.
//

import SwiftUI

struct NameAndEmailView: View {
    let contact: Contact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(contact.fullName)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(contact.email)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    NameAndEmailView(
        contact: .init(
            firstName: "Byambaa",
            lastName: "Ganbold",
            email: "byanba@gmail.com",
            phoneNumber: "80180808",
            address: "BZD Sansar",
            avatar: nil
            
        )
    )
}
