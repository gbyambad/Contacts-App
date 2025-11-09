//
//  Contacts_AppApp.swift
//  Contacts App
//
//  Created by Byambadorj on 2025.11.06.
//

import SwiftUI
import SwiftData

@main
struct Contacts_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Contact.self)
        }
    }
}
