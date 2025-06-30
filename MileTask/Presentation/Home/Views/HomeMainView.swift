//
//  HomeMainView.swift
//  MileTask
//
//  Created by asani on 28/06/25.
//

import SwiftUI
import ComposableArchitecture
import MileTaskComponent

struct HomeMainView: View {
    let store: StoreOf<HomeViewStore>
    private let router: HomePageRouter

    init(router: HomePageRouter) {
        self.router = router
        self.store = Store(
            initialState: HomeViewStore.State()
        ) {
            HomeViewStore()
        }
    }

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        Text("Hi, how's your days...")
                            .typographyStyle(.Custom(size: 12, .bold))
                            .foregroundColor(.TextInversePrimary)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Manage Your \nDaily Task")
                            .typographyStyle(.Custom(size: 24, .bold))
                            .foregroundColor(.TextInversePrimary)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        switch viewStore.tasks {
                        case .loading:
                            ForEach(0..<5) { _ in
                                skeletonLoad()
                            }
                        case .data(let tasks):
                            ForEach(tasks, id: \.self) { data in
                                TaskViewCell(
                                    data: data
                                )
                            }
                        case .empty:
                            HStack {
                                Spacer()
                                EmptyStateView(
                                    config: EmptyStateConfig(
                                        title: "Oops, You don't have task",
                                        desc: "You can click + button in the bottom left",
                                        imageName: "empty_state_illustration"
                                    )
                                )
                                Spacer()
                            }
                        default:
                            skeletonLoad()
                        }
                    }
                    .padding(.all, 16)
                }
                PlusButton(onClick: {
                    router.routeToAddFormPage()
                })
                .frame(width: 48, height: 48)
                .padding(.all, 16)
            }
            .background(Color.BackgroundPrimary)
            .onAppear {
                viewStore.send(.viewWillAppear)
            }
            .statusBarBackground(color: .BackgroundPrimary)
        }
    }
}

// MARK: - Loading View
extension HomeMainView {
    @ViewBuilder private func skeletonLoad() -> some View {
        VStack {
            VStack(spacing: 8) {
                HStack {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 12, height: 12)
                        .shimmering()

                    Spacer()

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 12)
                        .shimmering()
                }

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .shimmering()

                HStack {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 12, height: 12)
                        .shimmering()

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .shimmering()
                }

                HStack(spacing: 4) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 60, height: 12)
                        .shimmering()

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 80, height: 12)
                        .shimmering()

                    Spacer()
                }
            }
            .padding(16)
            .background(Color.BackgroundSecondaryPrimary)
        }
        .cornerRadius(12)
    }
}
