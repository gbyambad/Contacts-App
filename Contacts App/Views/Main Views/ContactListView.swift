//
//  ContactListView.swift
//  Contacts App
//
//  Created by Byambadorj on 2025.11.06.
//

import SwiftUI
import SwiftData


struct ContactListView: View {
    @Environment(\.modelContext) private var modelContext
    
    // Queries
    // First Name
    @Query(
        sort: \Contact.firstName,
        order: .forward
    )
    private var ContactsByFirstName: [Contact]
    
    // Last Name
    @Query(
        sort: \Contact.lastName,
        order: .forward
    )
    private var ContactsByLastName: [Contact]
    
    // Phone Number
    @Query(
        sort: \Contact.phoneNumber,
        order: .forward
    )
    private var ContactsByPhoneNumver: [Contact]
    @State private var selectedSortOrder: SortOrder = .firstName
    @State private var isSortOrderInverse: Bool = false
    @State private var isAdvancedShown: Bool = false
    @State private var showMore = false
    @State private var currentContact: Contact = Contact()
    @State private var isShowingAddContactSheet = false
    
    // State variable
    @State private var searchText: String = ""
    

   // Sorted Contacts
    var sortedContacts: [Contact] {
        let baseContacts: [Contact]
        switch selectedSortOrder {
        case .firstName:
            baseContacts = ContactsByFirstName
        case .lastName:
            baseContacts = ContactsByLastName
        case .phoneNumber:
            baseContacts = ContactsByPhoneNumver
        }
        return isSortOrderInverse ? baseContacts.reversed() : baseContacts
    }
    
    // Filter Contacts
    // TODO: implement Filtered Contacts
    var filterContacts: [Contact] {
        sortedContacts
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField(
                    "Search Contacts",
                    text: $searchText
                ).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SortAndOrderView(
                    selectedSortOrder: $selectedSortOrder,
                    isSortOrderInverse: $isSortOrderInverse
                )
                
                if isAdvancedShown {
                    Text("Todo: Filter Picker View")
                }
                
                List {
                    ForEach(filterContacts) { contact in
                        
                        ContactRowItemView(
                            contact: contact,
                            showMore: showMore
                        ).onTapGesture {
                            currentContact = contact
                            isShowingAddContactSheet.toggle()
                        }
                    }
                }
                
                Spacer()
                
            }
            .sheet(
                isPresented: $isShowingAddContactSheet,
                   content: {
                       Text("ContactRowItemView")
                       // TODO: insvert a new contact and toggle sheet and open ContactRowItemView
                   })
            .navigationTitle("Contacts")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing ) {
                        Button {
                            isAdvancedShown.toggle()
                            if !isAdvancedShown {
                                selectedSortOrder = .firstName
                            }
                        } label: {
                            Label("Advanced",
                                  systemImage: isAdvancedShown ? "wand.and.stars" : "wand.and.stars.inverse"
                            )
                        }
                        // Add
                        Button {
                            currentContact = Contact()
                            isShowingAddContactSheet.toggle()
                            
                        } label: {
                            Label(
                                "Add Contact",
                                systemImage: "plus"
                            )
                        }
                    }
            }
        }
    }
}

#Preview {
    ContactListView()
        .modelContainer(for: Contact.self)
}
