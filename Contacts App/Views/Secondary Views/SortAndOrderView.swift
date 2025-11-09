//
//  SortAndOrderView.swift
//  Contacts App
//
//  Created by Byambadorj on 2025.11.07.
//

import SwiftUI

struct SortAndOrderView: View {
    @Binding var selectedSortOrder: SortOrder
    @Binding var isSortOrderInverse: Bool
    
    var degrees: CGFloat {
        isSortOrderInverse ? 180: 0
    }
    
    var body: some View {
        HStack {
            Picker("Sort By", selection: $selectedSortOrder)
            {
                Text("First Name")
                    .tag(SortOrder.firstName)
                Text("Last Name")
                    .tag(SortOrder.lastName)
                Text("Phone Number")
                    .tag(SortOrder.phoneNumber)
            }.pickerStyle(PalettePickerStyle())
            
            Image(systemName: "arrowshape.down.fill")
                .foregroundStyle(.blue)
                .rotationEffect(.degrees(degrees))
                .animation(.spring, value: isSortOrderInverse)
                .onTapGesture {
                    isSortOrderInverse.toggle()
                }
        }
        .padding()
    }
}

#Preview {
    SortAndOrderView(
        selectedSortOrder: .constant(.firstName),
        isSortOrderInverse: .constant(true)
    )
}
