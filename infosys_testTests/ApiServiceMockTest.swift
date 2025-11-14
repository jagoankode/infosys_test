//
//  ApiServiceMockTest.swift
//  infosys_testTests
//
//  Created by Brillian Andrie on 14/11/25.
//

import Foundation
@testable import infosys_test

class ApiServiceMock: ApiServiceProtocol {

    var mockPosts: [PostModel] = []
    var mockDetail: PostModel?

    func fetchPosts() async throws -> [PostModel] {
        return mockPosts
    }

    func fetchPostDetail(id: Int) async throws -> PostModel {
        return mockDetail!
    }
}
