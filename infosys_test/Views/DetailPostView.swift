//
//  DetailPostView.swift
//  infosys_test
//
//  Created by Brillian Andrie on 14/11/25.
//

import SwiftUI

struct DetailPostView: View {
    let postId: Int
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var viewModel = PostDetailViewModel()

    var body: some View {
        AppBar(title: "Detail") {
            Button {
                coordinator.goBack()
            } label: {
                Image(systemName: "chevron.left")
                    .frame(width: 44, height: 44)
            }
        }
        Spacer()
        VStack(alignment: .leading, spacing: 16) {
            if viewModel.isLoading {

                ProgressView("Loading...")

            } else if viewModel.isError {
                ErrorView(
                    title: "Terjadi Kesalahan",
                    retryAction: {
                        Task { await viewModel.loadPostDetail(id: postId) }
                    }
                )
            } else if let post = viewModel.post {
                Text(post.title.capitalized)
                    .font(.title.bold())
                    .accessibilityIdentifier("dashboard_detail_post_title")
                Text(post.body)
                    .font(.body)
                    .accessibilityIdentifier("dashboard_detail_post_content")
            }

            Spacer()
        }
        .padding()
        .task { await viewModel.loadPostDetail(id: postId) }
        .navigationBarBackButtonHidden(true)
        Spacer()
    }
}

#Preview {
    DetailPostView(postId: 1)
}
