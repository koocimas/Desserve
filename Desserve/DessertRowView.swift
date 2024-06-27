//
//  DessertRowView.swift
//  Desserve
//
//  Created by Sam Cook on 6/26/24.
//

import SwiftUI

struct DessertRowView: View {
    var dessert: Dessert
    var body: some View {
        NavigationLink(dessert.name, destination: DessertDetailView(dessert: dessert))
    }
}

#Preview {
    DessertRowView(dessert: Dessert.previewDesserts[0])
}
