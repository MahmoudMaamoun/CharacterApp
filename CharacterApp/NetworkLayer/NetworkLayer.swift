//
//  NetworkLayer.swift
//  CharacterApp
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case requestFailed(Error)
    case invalidData
    case decodingFailed(Error)
}

class NetworkLayer {
    typealias CompletionHandler<T> = (Result<T, NetworkError>) -> Void
    
    func get<T: Decodable>(url: URL, responseType: T.Type, completion: @escaping CompletionHandler<T>) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.decodingFailed(error)))
            }
        }
        
        task.resume()
    }
}
