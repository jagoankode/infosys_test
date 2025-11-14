//
//  ApiService.swift
//  infosys_test
//
//  Created by Brillian Andrie on 14/11/25.
//

import Foundation

protocol ApiServiceProtocol {
    func fetchPosts() async throws -> [PostModel]
    func fetchPostDetail(id: Int) async throws -> PostModel
}

class ApiService: ApiServiceProtocol {
    static let shared = ApiService()
    private let bashUrl: String = "https://jsonplaceholder.typicode.com"

    func fetchPosts() async throws -> [PostModel] {
        let url = URL(string: "\(bashUrl)/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([PostModel].self, from: data)
    }

    func fetchPostDetail(id: Int) async throws -> PostModel {
        let url = URL(
            string: "\(bashUrl)/posts/\(id)"
        )!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(PostModel.self, from: data)
    }
}
