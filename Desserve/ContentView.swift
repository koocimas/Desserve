//
//  ContentView.swift
//  Desserve
//
//  Created by Sam Cook on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dessertService = DessertsService()
    @State private var searchText: String = ""
    @State private var alertIsPresented: Bool = false
    
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
            .background(RoundedRectangle(cornerRadius: 0)
                .fill(.banana).ignoresSafeArea())
            .onAppear {
                Task {
                    do {
                        try await dessertService.fetchDesserts()
                    } catch {
                        alertIsPresented = true
                        print("Failed to fetch desserts: \(error)")
                    }
                }
            }
            .alert(isPresented: $alertIsPresented) {
                        Alert(title: Text("Dessert Recipes Unavailable"),
                              message: Text("This isn't what you desserve! Please check your network and try again."),
                              dismissButton: .default(Text("OK")))
                    }
        }
    }
    var filteredDesserts: [Dessert] {
        let desserts = dessertService.desserts
        if searchText.isEmpty {
            return desserts
        } else {
            return desserts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
}

#Preview {
    ContentView()
}
