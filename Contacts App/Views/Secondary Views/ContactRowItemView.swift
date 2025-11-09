//
//  ContactRowItemView.swift
//  Contacts App
//
//  Created by Byambadorj on 2025.11.09.
//

import SwiftUI

struct ContactRowItemView: View {
    let contact: Contact
    let showMore: Bool
    
    var showAddressPhoneButton: Bool {
        !contact.phoneNumber.isEmpty || !contact.address.isEmpty
    }
    
    var body: some View {
       
        VStack(
            alignment: .leading,
            spacing: 8 ) {
            HStack {
                // Avatar
                Circle().frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 5) {
                    Text(contact.fullName)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(contact.email)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
                
                if showMore {
                    VStack(alignment: .leading, spacing: 10) {
                        if !contact.phoneNumber.isEmpty {
                            HStack {
                                Image(systemName: "phone.fill")
                                    .foregroundStyle(.blue)
                                Text(contact.phoneNumber)
                                    .foregroundStyle(.primary)
                            }
                        }
                        if !contact.address.isEmpty {
                            HStack {
                                Image(systemName: "house.fill")
                                    .foregroundStyle(.blue)
                                    .padding(.top, 2)
                                Text(contact.address)
                                    .foregroundStyle(.primary)
                                    .lineLimit(3)
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    ContactRowItemView(
        contact: .init(
            firstName: "Byambaa",
            lastName: "Ganbold",
            email: "byanba@gmail.com",
            phoneNumber: "80180808",
            address: "BZD Sansar",
            avatar: nil
            
        ),
        showMore: true
    ).padding()
}
