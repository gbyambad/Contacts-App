//
//  AvatarView.swift
//  Contacts App
//
//  Created by Byambadorj on 2025.11.10.
//


import SwiftUI

struct AvatarView: View {
    let contact: Contact
    
    var body: some View {
        if let avatarData = contact.avatar, let uiImage = UIImage(data: avatarData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.gray, lineWidth: 1)
                }
        } else {
            Circle()
                .fill(.blue.opacity(0.2))
                .frame(width: 50, height: 50)
                .overlay {
                    Text(contact.fullName.uppercased().prefix(1))
                        .font(.largeTitle)
                        .foregroundStyle(.blue)
                        .bold()
                } .padding(.trailing, 10)
        }
    }
}
#Preview {
    AvatarView(
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
