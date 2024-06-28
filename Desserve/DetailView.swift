//
//  DessertDetailView.swift
//  Desserve
//
//  Created by Sam Cook on 6/26/24.
//

import SwiftUI

struct DessertDetailView: View {
    @ObservedObject var infoService = InfoService()
    @State private var alertIsPresented: Bool = false
    var dessert: Dessert
    var info: Info
    var body: some View {
        ZStack {
            Color.banana.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    Text(dessert.name)
                        .font(.custom("Poppins-Bold", size: 35))
                        .multilineTextAlignment(.center)
                    AsyncImage( url: URL(string: dessert.image)) { image in
                      image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: .infinity, height: 300)
                        .border(.bubblegum, width: 3)
                    } placeholder: {
                      ProgressView()
                    }
                    Text("Instructions")
                        .font(.custom("Poppins-Bold", size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(info.strInstructions)
                        .font(.custom("Poppins-Regular", size: 18))
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.bubblegum, .white]), startPoint: .leading, endPoint: .trailing)).clipShape(RoundedRectangle(cornerRadius: 25.0))
                    Text(info.strIngredient1 ?? "")
                        .font(.custom("Poppins-Bold", size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("")
                        .font(.custom("Poppins-Regular", size: 18))
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.bubblegum, .white]), startPoint: .leading, endPoint: .trailing)).clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
                .padding()
            }
            .onAppear {
                Task {
                    do {
                        try await infoService.fetchInfo(mealId: dessert.id)
                    } catch {
                        alertIsPresented = true
                        print("Failed to fetch desserts: \(error)")
                    }
                }
            }
        }
        .padding(.top, 80)
        .ignoresSafeArea()
    }
}

#Preview {
    DessertDetailView(dessert: Dessert.dessertExample(), info: <#Info#>)
}
