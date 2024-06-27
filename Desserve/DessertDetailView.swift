//
//  DessertDetailView.swift
//  Desserve
//
//  Created by Sam Cook on 6/26/24.
//

import SwiftUI

struct DessertDetailView: View {
    var dessert: Dessert
    var body: some View {
        ZStack {
            Color.banana.ignoresSafeArea()
            VStack(spacing: 20) {
                Text(dessert.name)
                    .font(.custom("Poppins-Bold", size: 35))
                    .multilineTextAlignment(.center)
                Text("Instructions")
                    .font(.custom("Poppins-Bold", size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(dessert.instructions)
                    .font(.custom("Poppins-Regular", size: 18))
                    .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.bubblegum, .white]), startPoint: .leading, endPoint: .trailing))                    .clipShape(Capsule())
                Text("Ingredients")
                    .font(.custom("Poppins-Bold", size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(dessert.ingredients)
                    .font(.custom("Poppins-Regular", size: 18))
                    .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.bubblegum, .white]), startPoint: .leading, endPoint: .trailing))                    .clipShape(Capsule())
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    DessertDetailView(dessert: Dessert.previewDesserts[0])
}
