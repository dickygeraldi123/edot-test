//
//  PrimaryButton.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI

public struct PrimaryButton: View {
    public var onClick: (() -> Void)?
    @State public var isEnable: Bool

    public init(onClick: (() -> Void)? = nil, isEnable: Bool) {
        self.onClick = onClick
        self.isEnable = isEnable
    }

    public var body: some View {
        HStack {
            Text("Submit")
                .typographyStyle(.Custom(size: 18, .bold))
                .foregroundColor(isEnable ? .darkColor : .primaryTextLight)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.all, 16)
        }
        .background(isEnable ? Color(hex: "fee4c1") : .borderDark)
        .cornerRadius(12)
        .frame(height: 40)
        .onTapGesture {
            onClick?()
        }
    }
}
