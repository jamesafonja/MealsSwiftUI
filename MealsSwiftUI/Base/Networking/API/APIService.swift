//
//  APIService.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import Foundation

// MARK: APIService protocol
protocol APIService {
    func fetchObject<T: Decodable>(
        from url: URL,
        memberType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    )
}

