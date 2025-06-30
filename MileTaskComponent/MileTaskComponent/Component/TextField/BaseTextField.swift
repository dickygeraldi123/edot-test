//
//  BaseTextField.swift
//  MileTaskComponent
//
//  Created by asani on 29/06/25.
//

import SwiftUI

public struct BaseTextField: View {
    @Binding var text: String
    var title: String
    var placeHolder: String

    public init(text: Binding<String>, title: String, placeHolder: String) {
        self._text = text
        self.title = title
        self.placeHolder = placeHolder
    }

    public var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .typographyStyle(.Custom(size: 12, .medium))
                .foregroundColor(.TextInversePrimary)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                Group {
                    TextField(placeHolder, text: $text)
                        .keyboardType(.default)
                        .foregroundColor(.TextInversePrimary)
                        .font(Font.customFont(type: .medium, size: 12))
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                }
            }
            .padding(12)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
        }
    }
}

public struct ClickableTextField: View {
    @Binding var text: String
    var title: String
    var placeHolder: String
    var onClick: (() -> Void)?

    public init(text: Binding<String>, title: String, placeHolder: String, onClick: (() -> Void)?) {
        self._text = text
        self.title = title
        self.placeHolder = placeHolder
        self.onClick = onClick
    }

    public var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .typographyStyle(.Custom(size: 12, .medium))
                .foregroundColor(.TextInversePrimary)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                Group {
                    if text.isEmpty {
                        Text(placeHolder)
                            .font(Font.customFont(type: .medium, size: 12))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                        Text(text)
                            .font(Font.customFont(type: .medium, size: 12))
                            .foregroundColor(.TextInversePrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(12)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
            .onTapGesture {
                onClick?()
            }
        }
    }
}
