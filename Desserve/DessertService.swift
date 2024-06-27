////
////  DessertService.swift
////  Desserve
////
////  Created by Sam Cook on 6/26/24.
////
//
//import Foundation
//
//class DessertService: ObservableObject {
//    @Published var desserts: [Dessert] = []
//    
//    enum downloadError: Error {
//        case invalidURL
//        case decodingError
//        case unknownError
//    }
//    
//    func fetchPhotos() async {
//        do {
//        let urlString = ""
//        guard let url = URL(string: urlString) else {
//            throw downloadError.invalidURL
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        
//            let (data, _) = try await URLSession.shared.data(for: request)
//                   
//                   let decodedResponse = try JSONDecoder().decode(Dessert.self, from: data)
//                   DispatchQueue.main.async {
//                       self.desserts = decodedResponse.desserts
//                   }
//               } catch {
//                 print(downloadError.unknownError)
//               }
//           }
//}
