//
//  InfoService.swift
//  Desserve
//
//  Created by Sam Cook on 6/27/24.
//

import Foundation

class InfoService: ObservableObject {
    @Published var mealInfo: [Info] = []
    
    enum DownloadError: Error {
        case invalidURL
        case decodingError
        case networkError(statusCode: Int)
        case unknownError
    }
    
    func fetchInfo(mealId: String) async throws {
        let urlString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)"
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
            let decodedResponse = try JSONDecoder().decode(InfoResults.self, from: data)
            await MainActor.run {
                self.mealInfo = decodedResponse.meals
            }
        } catch {
            throw DownloadError.decodingError
        }
    }
}
