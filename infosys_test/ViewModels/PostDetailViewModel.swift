//
//  PostDetailViewModel.swift
//  infosys_test
//
//  Created by Brillian Andrie on 14/11/25.
//

import Combine
import Foundation

@MainActor
class PostDetailViewModel: ObservableObject {
    @Published var post: PostModel?
    @Published var isLoading = false
    @Published var isError = false

    private let service: ApiServiceProtocol

    init(service: ApiServiceProtocol? = nil) {
        self.service = service ?? ApiService.shared
    }

    func loadPostDetail(id: Int) async {
        isLoading = true
        defer { isLoading = false }

        do {
            post = try await service.fetchPostDetail(id: id)
        } catch {
            isLoading = false
            isError = true
        }
    }
}
