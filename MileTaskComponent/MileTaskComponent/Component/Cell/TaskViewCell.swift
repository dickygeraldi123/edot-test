//
//  TaskViewCell.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI
import MileTaskDomain

public struct TaskViewCell: View {
    let data: TaskModel

    public init(data: TaskModel) {
        self.data = data
    }

    public var body: some View {
        VStack {
            VStack(spacing: 8) {
                HStack {
                    PriorityCircleCell(priority: PriorityTaskEnum(rawValue: data.priority ?? ""))
                    Spacer()
                }

                Text(data.title ?? "")
                    .typographyStyle(.Custom(size: 14, .bold))
                    .foregroundColor(.TextInverseSecondary)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    Image.ComponentImage(named: Image.getImageByMode(named: "ic_time"))?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 12, height: 12)

                    Text("Start Date: ")
                        .typographyStyle(.Custom(size: 12, .regular))
                        .foregroundColor(.TextInverseSecondary)
                        .lineLimit(1)
                    Text(data.startDate.formatDate())
                        .typographyStyle(.Custom(size: 12, .regular))
                        .foregroundColor(.TextInversePrimary)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                }

                HStack(spacing: 4) {
                    Text("Due Date: ")
                        .typographyStyle(.Custom(size: 12, .regular))
                        .foregroundColor(.TextInverseSecondary)
                        .lineLimit(1)
                    Text(data.dueDate.formatDate())
                        .typographyStyle(.Custom(size: 12, .regular))
                        .foregroundColor(.TextInversePrimary)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                }
            }
            .padding(.all, 16)
            .background(Color.BackgroundSecondaryPrimary)
        }
        .cornerRadius(12)
    }
}
