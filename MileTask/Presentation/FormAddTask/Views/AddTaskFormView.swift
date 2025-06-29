//
//  AddTaskFormView.swift
//  MileTask
//
//  Created by asani on 28/06/25.
//

import SwiftUI
import MileTaskComponent

struct AddTaskFormView: View {
    var body: some View {
        VStack {
            NavigationHeaderView(title: "Add New Task")
            ScrollView {
                LazyVStack(spacing: 24) {
                    BaseTextField(
                        title: "Task Name",
                        placeHolder: "Insert Task Name"
                    )

                    BaseTextField(
                        title: "Priority",
                        placeHolder: "Insert Priority"
                    )

                    BaseTextField(
                        title: "Start Date",
                        placeHolder: "Insert Start Date"
                    )

                    BaseTextField(
                        title: "End Date",
                        placeHolder: "Insert End Date"
                    )

                    PrimaryButton(isEnable: true)
                        .padding(.top, 24)
                }
                .padding(.all, 16)
            }
        }
        .background(Color.BackgroundPrimary)
        .statusBarBackground(color: Color.BackgroundPrimary)
    }
}

#Preview {
    AddTaskFormView()
}
