//
//  PostViewModel.swift
//  infosys_test
//
//  Created by Brillian Andrie on 14/11/25.
//

import Combine
import Foundation

@MainActor
class PostViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    @Published var isLoading = false
    @Published var isError = false

    private let service: ApiServiceProtocol

    init(service: ApiServiceProtocol? = nil) {
        self.service = service ?? ApiService.shared
    }

    func loadPosts() async {
        isLoading = true
        isError = false
        
        defer { isLoading = false }

        do {
            posts = try await service.fetchPosts()
        } catch {
            isLoading = false
            isError = true
        }
    }
}
