//
//  AddTaskFormView.swift
//  MileTask
//
//  Created by asani on 28/06/25.
//

import SwiftUI
import MileTaskComponent
import ComposableArchitecture

struct AddTaskFormView: View {
    var store: StoreOf<AddTaskFormStore>
    @State private var showActionSheet = false

    init(router: AddTaskFormRouter) {
        self.store = Store(
            initialState: AddTaskFormStore.State(
                router: router
            )
        ) {
            AddTaskFormStore()
        }
    }

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                NavigationHeaderView(
                    title: "Add New Task",
                    onTapBack: {
                        viewStore.send(.backView)
                    }
                )
                ScrollView {
                    LazyVStack(spacing: 24) {
                        BaseTextField(
                            text: viewStore.binding(
                                get: \.taskName,
                                send: { newValue in
                                    .mapTaskName(newValue)
                                }
                            ),
                            title: "Task Name",
                            placeHolder: "Insert Task Name"
                        )

                        ClickableTextField(
                            text: viewStore.binding(
                                get: \.priority,
                                send: { newValue in
                                    .mapPriority(newValue)
                                }
                            ),
                            title: "Priority",
                            placeHolder: "Insert Priority",
                            onClick: {
                                showActionSheet = true
                            }
                        )

                        VStack(spacing: 12) {
                            Text("Start Date")
                                .typographyStyle(.Custom(size: 12, .medium))
                                .foregroundColor(.TextInversePrimary)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack {
                                DatePicker("", selection: viewStore.binding(
                                    get: \.startDate,
                                    send: { newValue in
                                        .mapStartDate(newValue)
                                    }
                                ), in: Date()...)
                                .labelsHidden()
                                .typographyStyle(.Custom(size: 12, .medium))
                                .foregroundColor(.TextInversePrimary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.secondarySystemBackground))

                                Spacer()
                            }
                            .cornerRadius(12)
                            .frame(height: 48)
                        }

                        VStack(spacing: 12) {
                            Text("Due Date")
                                .typographyStyle(.Custom(size: 12, .medium))
                                .foregroundColor(.TextInversePrimary)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack {
                                DatePicker("", selection: viewStore.binding(
                                    get: \.dueDate,
                                    send: { newValue in
                                        .mapDueDate(newValue)
                                    }
                                ), in: viewStore.startDate...)
                                .labelsHidden()
                                .typographyStyle(.Custom(size: 12, .medium))
                                .foregroundColor(.TextInversePrimary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.secondarySystemBackground))

                                Spacer()
                            }
                            .cornerRadius(12)
                            .frame(height: 48)
                        }

                        PrimaryButton(
                            onClick: {
                                viewStore.send(.saveTask)
                            },
                            isEnable: viewStore.binding(
                                get: \.enableButton,
                                send: { _ in .emptyAction }
                            )
                        )
                            .padding(.top, 24)
                    }
                    .padding(.all, 16)
                }
            }
            .onUIKitViewDidLoad {
                viewStore.send(.viewDidLoad)
            }
            .actionSheet(isPresented: $showActionSheet) {
                let buttons: [ActionSheet.Button] = viewStore.allPriority.map { data in
                    .default(Text(data)) {
                        viewStore.send(.mapPriority(data))
                    }
                } + [.cancel()]

                return ActionSheet(
                    title: Text("Please insert the priority task"),
                    message: nil,
                    buttons: buttons
                )
            }
        }
        .background(Color.BackgroundPrimary)
        .statusBarBackground(color: Color.BackgroundPrimary)
        .navigationBarHidden(true)
    }
}
