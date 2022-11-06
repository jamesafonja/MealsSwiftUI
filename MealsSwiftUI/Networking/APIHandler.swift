//
//  APIHandler.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import Foundation

// MARK: - API Handler
class APIHandler: APIService {
    
    // MARK: Singleton
    private init() {}
    static let shared = APIHandler()
    
    // MARK: Fetch Object function
    func fetchObject<T: Decodable>(
        from url: URL,
        memberType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard
                let data = data,
                error == nil
            else {
                completion(.failure(error!))
                return
            }

            do {
                let decodedObject = try JSONDecoder().decode(memberType, from: data)
                completion(.success(decodedObject))
            } catch let decoderError {
                completion(.failure(decoderError))
            }
        }
        .resume()
    }
}
