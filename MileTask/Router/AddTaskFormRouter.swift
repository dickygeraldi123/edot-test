//
//  AddTaskFormRouter.swift
//  MileTask
//
//  Created by asani on 30/06/25.
//


import SwiftUI


class AddTaskFormRouter {
    private let rootCoordinator: NavigationCoordinator
    private var id: UUID = UUID()

    init(rootCoordinator: NavigationCoordinator) {
        self.rootCoordinator = rootCoordinator
    }
}

// MARK: - ViewFactory implementation
extension AddTaskFormRouter: Routable {
    func makeView() -> AnyView {
        let view = AddTaskFormView(router: self)
        return AnyView(view)
    }

    func popView() {
        rootCoordinator.popLast()
    }
}

// MARK: - Hashable implementation
extension AddTaskFormRouter {
    static func == (lhs: AddTaskFormRouter, rhs: AddTaskFormRouter) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
