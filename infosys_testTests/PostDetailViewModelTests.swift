//
//  PostDetailViewModelTests.swift
//  infosys_testTests
//
//  Created by Brillian Andrie on 14/11/25.
//

import XCTest
@testable import infosys_test

final class PostDetailViewModelTests: XCTestCase {

    @MainActor
    func testLoadPostDetail() async {
            let mock = ApiServiceMock()
            mock.mockDetail = PostModel(userId: 1, id: 38, title: "Detail", body: "Body...")

            let vm = PostDetailViewModel(service: mock)

            await vm.loadPostDetail(id: 38)

            XCTAssertNotNil(vm.post)
            XCTAssertEqual(vm.post?.id, 38)
            XCTAssertEqual(vm.post?.title, "Detail")
        }

}
