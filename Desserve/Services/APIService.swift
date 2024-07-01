//
//  Services.swift
//  Desserve
//
//  Created by Sam Cook on 6/30/24.
//

import Foundation

class APIService {
    enum APIError: Error {
        case invalidURL
        case decodingError
        case networkError(statusCode: Int)
        case unknownError
    }
    
    func fetchData<T: Decodable>(from urlString: String, responseType: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unknownError
        }
        
        guard httpResponse.statusCode == 200 else {
            throw APIError.networkError(statusCode: httpResponse.statusCode)
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(responseType, from: data)
            return decodedResponse
        } catch {
            throw APIError.decodingError
        }
    }
}
