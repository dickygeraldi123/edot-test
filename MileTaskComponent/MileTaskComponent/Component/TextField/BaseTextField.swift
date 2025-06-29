//
//  BaseTextField.swift
//  MileTaskComponent
//
//  Created by asani on 29/06/25.
//

import SwiftUI

public struct BaseTextField: View {
    @State private var text = ""
    var title: String
    var placeHolder: String

    public init(text: String = "", title: String, placeHolder: String) {
        self.text = text
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

            BasicTextField(
                text: $text,
                placeholder: placeHolder,
                inputType: .normal,
                validation: .none,
                keyboard: .default,
                textCase: .capitalized
            )
        }
    }
}
