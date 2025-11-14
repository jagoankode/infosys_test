//
//  AppCoordinator.swift
//  infosys_test
//
//  Created by Brillian Andrie on 14/11/25.
//

import Combine
import SwiftUI

class AppCoordinator: ObservableObject {

    @Published var path = NavigationPath()
    @Published var showSplash = true

    init() {
        start()
    }

    func start() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showSplash = false
        }
    }

    func goToDashboard() {
        path.append(Route.dashboard)
    }

    func goToDetail(id: Int) {
        path.append(Route.detail(postId: id))
    }

    func goBack() {
        path.removeLast()
    }
}
