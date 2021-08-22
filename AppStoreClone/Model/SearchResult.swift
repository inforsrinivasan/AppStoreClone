//
//  SearchResult.swift
//  AppStoreClone
//
//  Created by Srinivasan Rajendran on 2021-08-22.
//

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
}
