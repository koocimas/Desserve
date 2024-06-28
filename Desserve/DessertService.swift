//
//  DessertService.swift
//  Desserve
//
//  Created by Sam Cook on 6/26/24.
//

import Foundation

class DessertsService: ObservableObject {
    @Published var desserts: [Dessert] = []
    
    enum DownloadError: Error {
        case invalidURL
        case decodingError
        case networkError(statusCode: Int)
        case unknownError
    }
    
    func fetchDesserts() async throws {
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        guard let url = URL(string: urlString) else {
            throw DownloadError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw DownloadError.unknownError
        }
        
        guard httpResponse.statusCode == 200 else {
            throw DownloadError.networkError(statusCode: httpResponse.statusCode)
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(DessertResults.self, from: data)
            await MainActor.run {
                self.desserts = decodedResponse.meals
            }
        } catch {
            throw DownloadError.decodingError
        }
    }
}
