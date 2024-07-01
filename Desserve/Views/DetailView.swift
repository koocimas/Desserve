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
    let dessert: Dessert
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
                            .frame(minWidth: 100, idealHeight: 300)
                            .border(.bubblegum, width: 3)
                    } placeholder: {
                        ProgressView()
                    }
                    if let instructions = infoService.mealInfo.first?.strInstructions {
                        Text("Instructions")
                            .font(.custom("Poppins-Bold", size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(instructions)
                            .font(.custom("Poppins-Regular", size: 18))
                            .lineSpacing(10.0)
                            .padding()
                            .background(
                                LinearGradient(gradient: Gradient(colors: [.bubblegum, .white]), startPoint: .leading, endPoint: .trailing)).clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                    Text("Ingredients")
                        .font(.custom("Poppins-Bold", size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if let ingredients = infoService.mealInfo.first?.ingredients {
                        ForEach(0..<ingredients.count, id: \.self) { index in
                            let ingredient = ingredients[index]
                            Text("• \(ingredient.name): \(ingredient.measure)")
                        }
                        .font(.custom("Poppins-Regular", size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.bubblegum, .white]), startPoint: .leading, endPoint: .trailing)).clipShape(RoundedRectangle(cornerRadius: 25.0))
                    }
                }
                .padding()
            }
            .alert(isPresented: $alertIsPresented) {
                Alert(title: Text("Dessert Details Unavailable"),
                      message: Text("This isn't what you desserve! Please check your network and try again."),
                      dismissButton: .default(Text("OK")))
            }
            .task {
                do {
                    try await infoService.fetchInfo(mealId: dessert.id)
                } catch {
                    alertIsPresented = true
                    print("Failed to fetch desserts: \(error)")
                }
            }
        }
        .padding(.top, 80)
        .padding([.bottom])
        .ignoresSafeArea()
    }
}

#Preview {
    DessertDetailView(dessert: Dessert.dessertExample())
}
