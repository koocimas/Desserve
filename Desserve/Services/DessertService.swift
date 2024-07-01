//
//  DessertService.swift
//  Desserve
//
//  Created by Sam Cook on 6/26/24.
//

import Foundation

class DessertsService: ObservableObject {
    @Published var desserts: [Dessert] = []
    private let apiService = APIService()
    
    func fetchDesserts() async throws {
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        do {
            let decodedResponse = try await apiService.fetchData(from: urlString, responseType: DessertResults.self)
            await MainActor.run {
                self.desserts = decodedResponse.meals
            }
        } catch {
            throw error
        }
    }
}

