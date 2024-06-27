//
//  ContentView.swift
//  Desserve
//
//  Created by Sam Cook on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    var desserts: [Dessert] = Dessert.previewDesserts
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredDesserts.sorted(), id: \.id) { dessert in
                    DessertRowView(dessert: dessert)
                        .listRowBackground(Color.banana).ignoresSafeArea()
                }
                .font(.custom("Poppins-Regular", size: 18))
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Discover delectable desserts...")
            .listStyle(.plain)
            .navigationTitle("desserve")
            .toolbarBackground(.hidden)
            .background(RoundedRectangle(cornerRadius: 0)
                .fill(.banana).ignoresSafeArea())
        }
    }
    var filteredDesserts: [Dessert] {
        if searchText.isEmpty {
            return desserts
        } else {
            return desserts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#Preview {
    ContentView(desserts: Dessert.previewDesserts)
}
