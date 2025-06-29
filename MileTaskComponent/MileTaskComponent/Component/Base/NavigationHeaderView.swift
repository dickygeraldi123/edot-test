//
//  NavigationHeaderView.swift
//  MileTaskComponent
//
//  Created by asani on 29/06/25.
//

import SwiftUI

public struct NavigationHeaderView: View {
    var title: String
    var onTapBack: (() -> Void)?

    public init(title: String, onTapBack: (() -> Void)? = nil) {
        self.title = title
        self.onTapBack = onTapBack
    }

    public var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 8) {
                Image.ComponentImage(named: Image.getImageByMode(named: "ic_back"))?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        onTapBack?()
                    }
                
                Text(title)
                    .typographyStyle(.Custom(size: 16, .bold))
                    .foregroundColor(.TextInversePrimary)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.all, 16)

            Divider()
                .background(Color.borderLinePrimary)
                .frame(height: 1)
        }
        .background(Color.BackgroundPrimary)
    }
}

#Preview {
    NavigationHeaderView(title: "Add Form")
}
