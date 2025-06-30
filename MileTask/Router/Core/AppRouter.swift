//
//  AppRouter.swift
//  MileTask
//
//  Created by asani on 30/06/25.
//

import SwiftUI

class AppRouter: ObservableObject {
    @Published var paths: NavigationPath

    init(paths: NavigationPath = NavigationPath()) {
        self.paths = paths
    }

    func resolveInitialRouter() -> any Routable {
        let homePageRouter = HomePageRouter(rootCoordinator: self)
        return homePageRouter
    }
}

// MARK: NavigationCoordinator implementation
extension AppRouter: NavigationCoordinator {
    func push(_ router: any Routable) {
        DispatchQueue.main.async {
            let wrappedRouter = AnyRoutable(router)
            self.paths.append(wrappedRouter)
        }
    }
    
    func popLast() {
        DispatchQueue.main.async {
            self.paths.removeLast()
        }
    }
    
    func popToRoot() {
        DispatchQueue.main.async {
            self.paths.removeLast(self.paths.count)
        }
    }
}

struct CustomNavigationView: View {
    @StateObject var appRouter: AppRouter

    var body: some View {
        NavigationStack(path: $appRouter.paths) {
            appRouter.resolveInitialRouter().makeView()
                .navigationDestination(for: AnyRoutable.self) { router in
                    router.makeView()
                }
        }
    }
}
