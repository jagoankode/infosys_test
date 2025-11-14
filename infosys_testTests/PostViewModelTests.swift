//
//  PostViewModelTests.swift
//  infosys_testTests
//
//  Created by Brillian Andrie on 14/11/25.
//

import XCTest
@testable import infosys_test

final class PostViewModelTests: XCTestCase {

    @MainActor
    func testLoadPosts() async {
        let mock = ApiServiceMock()
        mock.mockPosts = [
            PostModel(userId: 1, id: 1, title: "Test", body: "Body")
        ]

        let vm = PostViewModel(service: mock)

        await vm.loadPosts()

        XCTAssertEqual(vm.posts.count, 1)
        XCTAssertEqual(vm.posts.first?.title, "Test")
    }
}

