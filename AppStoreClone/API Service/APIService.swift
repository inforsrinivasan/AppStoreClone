//
//  APIService.swift
//  AppStoreClone
//
//  Created by Srinivasan Rajendran on 2021-08-22.
//

import Foundation

final class APIService {

    static let shared = APIService()

    func fetchApps(completion: @escaping (Swift.Result<[Result], Error>) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) {data, _, error in

            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            let resultType = Swift.Result(catching: { try JSONDecoder().decode(SearchResult.self, from: data) }).map { $0.results }
            completion(resultType)
        }.resume()
    }
}
