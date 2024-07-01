//
//  InfoService.swift
//  Desserve
//
//  Created by Sam Cook on 6/27/24.
//

import Foundation

class InfoService: ObservableObject {
    @Published var mealInfo: [Meal] = []
    private let apiService = APIService()
    
    enum DownloadError: Error {
        case invalidURL
        case decodingError
        case networkError(statusCode: Int)
        case unknownError
    }
    
    func fetchInfo(mealId: String) async throws {
        let urlString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)"
        
        do {
            let decodedResponse = try await apiService.fetchData(from: urlString, responseType: InfoResults.self)
            await MainActor.run {
                self.mealInfo = decodedResponse.meals
            }
        } catch {
            throw error
        }
    }
}
