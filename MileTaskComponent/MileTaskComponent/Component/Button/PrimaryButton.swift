//
//  PrimaryButton.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI

public struct PrimaryButton: View {
    public var title: String?
    public var onClick: (() -> Void)?
    @Binding public var isEnable: Bool

    public init(title: String? = nil, onClick: (() -> Void)? = nil, isEnable: Binding<Bool>) {
        self.title = title
        self.onClick = onClick
        self._isEnable = isEnable
    }

    public var body: some View {
        HStack {
            Text(title != nil ? title! : "Submit")
                .typographyStyle(.Custom(size: 18, .bold))
                .foregroundColor(isEnable ? .darkColor : .primaryTextLight)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.all, 16)
        }
        .background(isEnable ? Color(hex: "fee4c1") : .borderDark)
        .cornerRadius(12)
        .frame(height: 40)
        .onTapGesture {
            if isEnable {
                onClick?()
            }
        }
    }
}
