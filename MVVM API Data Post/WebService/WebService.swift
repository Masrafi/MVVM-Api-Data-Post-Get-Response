//
//  WebService.swift
//  MVVM API Data Fetch
//
//  Created by Masrafi Anam on 28/7/24.
//

import Foundation

final class WebService { // get request
    
    static func getUsersData(name: String, id: String, email: String) async throws -> [UserModel] {
    
        let urlString = "https://api.github.com/users"
        guard let url = URL(string: urlString) else {
            throw UserError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([UserModel].self, from: data)
        } catch {
            throw UserError.invalidData
        }
    }
}



//final class WebService {  // post data
//    static func getUsersData(name: String, id: String, email: String) async throws -> [UserModel] {
//        var components = URLComponents(string: "https://api.github.com/users")
//        components?.queryItems = [
//            URLQueryItem(name: "name", value: name),
//            URLQueryItem(name: "id", value: id),
//            URLQueryItem(name: "email", value: email)
//        ]
//        
//        guard let url = components?.url else {
//            throw UserError.invalidURL
//        }
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        guard let httpResponse = response as? HTTPURLResponse,
//              httpResponse.statusCode == 200 else {
//            throw UserError.invalidResponse
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            return try decoder.decode([UserModel].self, from: data)
//        } catch {
//            throw UserError.invalidData
//        }
//    }
//}
//
