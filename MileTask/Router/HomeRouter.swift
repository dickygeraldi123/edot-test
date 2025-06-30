//
//  HomeRouter.swift
//  MileTask
//
//  Created by asani on 30/06/25.
//

import SwiftUI

class HomePageRouter {
    private let rootCoordinator: NavigationCoordinator
    private var id: UUID = UUID()

    init(rootCoordinator: NavigationCoordinator) {
        self.rootCoordinator = rootCoordinator
    }

    func routeToAddFormPage() {
        let router = AddTaskFormRouter(rootCoordinator: self.rootCoordinator)
        rootCoordinator.push(router)
    }
}

// MARK: - ViewFactory implementation

extension HomePageRouter: Routable {
    func makeView() -> AnyView {
        let view = HomeMainView(router: self)
        return AnyView(view)
    }
}

// MARK: - Hashable implementation
extension HomePageRouter {
    static func == (lhs: HomePageRouter, rhs: HomePageRouter) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
