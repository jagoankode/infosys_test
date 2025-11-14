//
//  MainApp.swift
//  infosys_test
//
//  Created by Brillian Andrie on 14/11/25.
//

import SwiftUI

@main
struct MainApp: App {
    @StateObject var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                Group {
                    if coordinator.showSplash {
                        SplashScreenView()
                    } else {
                        DashboardView()
                    }
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .dashboard:
                        DashboardView()
                    case .detail(let id):
                        DetailPostView(postId: id)
                    }
                }
            }
            .environmentObject(coordinator)
        }
    }
}
