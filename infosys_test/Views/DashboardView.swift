//
//  DashboardView.swift
//  infosys_test
//
//  Created by Brillian Andrie on 14/11/25.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        AppBar(title: "Beranda")
            .accessibilityIdentifier("dashboard_appbar")
        Spacer()
        Group {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .accessibilityIdentifier("dashboard_loading")
            } else if viewModel.isError {
                ErrorView(
                    title: "Terjadi Kesalahan",
                    retryAction: {
                        Task { await viewModel.loadPosts() }
                    }
                ).accessibilityIdentifier("dashboard_error_view")
            } else {
                List(viewModel.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title.capitalized)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .lineLimit(2)
                            .foregroundColor(.gray)
                    }
                    .onTapGesture {
                        coordinator.goToDetail(id: post.id)
                    }
                }
                .accessibilityIdentifier("dashboard_post_list")
            }
        }
        .task { await viewModel.loadPosts() }
        Spacer()
    }
}

#Preview {
    DashboardView()
}
