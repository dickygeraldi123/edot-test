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
    var onTapStart: (() -> Void)?

    public init(data: TaskModel, onTapStart: (() -> Void)? = nil) {
        self.data = data
        self.onTapStart = onTapStart
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

                if (Date(timeIntervalSince1970: data.dueDate) > Date()) {
                    Spacer()
                        .frame(height: 10)

                    HStack(spacing: 12) {
                        HStack {
                            Text("Start")
                                .typographyStyle(.Custom(size: 18, .bold))
                                .foregroundColor(.darkColor)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.all, 6)
                        }
                        .background(Color(hex: "fee4c1"))
                        .cornerRadius(12)
                        .frame(width: 75, height: 24)
                        .onTapGesture {
                            onTapStart?()
                        }

                        Text("Start to doing this task early")
                            .typographyStyle(.Custom(size: 12, .regular))
                            .foregroundColor(.TextInversePrimary)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.bottom, 16)
                }
            }
            .padding(.all, 16)
            .background(Color.BackgroundSecondaryPrimary)
        }
        .cornerRadius(12)
    }
}
